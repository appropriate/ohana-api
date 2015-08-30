class OrganizationImporter < EntityImporter
  protected

  def self.required_headers
    %w(id accreditations alternate_name date_incorporated
       description email funding_sources legal_status
       licenses name tax_id tax_status website)
  end

  def self.process_row(row)
    OrganizationPresenter.new(row.to_hash).to_org
  end
end
