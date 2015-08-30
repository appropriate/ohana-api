class PhoneImporter < EntityImporter
  protected

  def self.required_headers
    %w(id location_id organization_id service_id contact_id department
       extension number number_type vanity_number country_prefix)
  end

  def self.process_row(row)
    PhonePresenter.new(row.to_hash).to_phone
  end
end
