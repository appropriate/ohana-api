class ContactImporter < EntityImporter
  protected

  def self.required_headers
    %w(id location_id organization_id service_id department email name
       title)
  end

  def self.process_row(row)
    ContactPresenter.new(row.to_hash).to_contact
  end
end
