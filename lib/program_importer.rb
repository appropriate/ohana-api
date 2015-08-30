class ProgramImporter < EntityImporter
  protected

  def self.required_headers
    %w(id organization_id name alternate_name)
  end

  def self.process_row(row)
    ProgramPresenter.new(row.to_hash).to_program
  end
end
