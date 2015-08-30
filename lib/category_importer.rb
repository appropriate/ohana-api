class CategoryImporter < EntityImporter
  protected

  def self.required_headers
    %w(taxonomy_id name parent_id parent_name)
  end
end
