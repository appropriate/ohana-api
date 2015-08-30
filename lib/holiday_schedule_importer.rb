class HolidayScheduleImporter < EntityImporter
  protected

  def self.required_headers
    %w(id location_id service_id closed start_date end_date opens_at
       closes_at)
  end
end
