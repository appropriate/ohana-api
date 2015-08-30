class RegularScheduleImporter < EntityImporter
  protected

  def self.required_headers
    %w(id location_id service_id weekday opens_at closes_at)
  end
end
