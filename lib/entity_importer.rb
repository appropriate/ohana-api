require 'csv'

EntityImporter = Struct.new(:content) do
  attr_writer :errors

  def self.import_file(path)
    File.open(path) do |io|
      new(io).tap(&:import)
    end
  end

  def self.check_and_import_file(path)
    check = FileChecker.new(path, required_headers).validate

    if check != 'skip import'
      Kernel.puts("\n===> Importing #{path.to_s.split('/').last}")
      process_import(path)
    end
  end

  def self.process_import(path)
    importer = import_file(path)
    importer.errors.each { |e| Kernel.puts(e) } unless importer.valid?
  end

  def errors
    # TODO: Figure out the right way to handle this
    import if @errors.nil?

    @errors
  end

  def valid?
    !(errors.nil? || errors.present?)
  end

  def import
    self.errors = []
    entities.each_with_index do |e,index|
      unless e.save
        errors << ImporterErrors.new(e, index + 2).message
      end
    end
  end

  protected

  def self.required_headers
    raise NotImplementedError
  end

  def self.process_row(row)
    presenter_class.new(row.to_hash).to_entity
  end

  def self.presenter_class
    @presenter_class ||= self.name.gsub(/Importer/, 'Presenter').constantize
  end

  def process_row(row)
    self.class.process_row(row)
  end

  def csv
    @csv ||= CSV.new(content, headers: true, header_converters: :symbol)
  end

  def csv_entries
    @csv_entries ||= csv.entries
  end

  def entities
    return enum_for(:entities) unless block_given?

    csv.lazy.each do |row|
      yield process_row(row)
    end
  end
end
