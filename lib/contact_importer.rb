class ContactImporter < EntityImporter
  protected

  def self.required_headers
    %w(id location_id organization_id service_id department email name
       title)
  end
end
