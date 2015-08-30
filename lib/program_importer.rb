class ProgramImporter < EntityImporter
  protected

  def self.required_headers
    %w(id organization_id name alternate_name)
  end
end
