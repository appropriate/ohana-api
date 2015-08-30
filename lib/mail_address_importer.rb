class MailAddressImporter < EntityImporter
  protected

  def self.required_headers
    %w(id location_id attention address_1 address_2 city state_province postal_code
       country)
  end

  def self.process_row(row)
    MailAddressPresenter.new(row.to_hash).to_mail_address
  end
end
