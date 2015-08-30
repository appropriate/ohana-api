class HolidayScheduleImporter < EntityImporter
  protected

  def self.required_headers
    %w(id location_id service_id closed start_date end_date opens_at
       closes_at)
  end

  def self.process_row(row)
    HolidaySchedulePresenter.new(row.to_hash).to_holiday_schedule
  end
end
