class CategoryImporter < EntityImporter
  protected

  def self.required_headers
    %w(taxonomy_id name parent_id parent_name)
  end

  def self.process_row(row)
    CategoryPresenter.new(row.to_hash).to_category
  end
end
