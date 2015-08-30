class RegularScheduleImporter < EntityImporter
  protected

  def self.required_headers
    %w(id location_id service_id weekday opens_at closes_at)
  end

  def self.process_row(row)
    RegularSchedulePresenter.new(row.to_hash).to_regular_schedule
  end
end
