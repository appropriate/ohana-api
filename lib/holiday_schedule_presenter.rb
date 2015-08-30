include ParentAssigner

HolidaySchedulePresenter = Struct.new(:row) do
  def to_holiday_schedule
    holiday_schedule = HolidaySchedule.find_or_initialize_by(id: row[:id].to_i)
    holiday_schedule.attributes = row
    assign_parents_for(holiday_schedule, row)
    holiday_schedule
  end
  alias :to_entity :to_holiday_schedule
end
