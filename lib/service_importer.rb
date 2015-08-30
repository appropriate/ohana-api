class ServiceImporter < EntityImporter
  protected

  def self.required_headers
    %w(id location_id program_id accepted_payments alternate_name description
       eligibility email fees funding_sources application_process languages name
       required_documents service_areas status website wait_time)
  end
end
