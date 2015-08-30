class MailAddressImporter < EntityImporter
  protected

  def self.required_headers
    %w(id location_id attention address_1 address_2 city state_province postal_code
       country)
  end
end
