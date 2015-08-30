include ParentAssigner

RegularSchedulePresenter = Struct.new(:row) do
  def to_regular_schedule
    regular_schedule = RegularSchedule.find_or_initialize_by(id: row[:id].to_i)
    regular_schedule.attributes = row
    assign_parents_for(regular_schedule, row)
    regular_schedule
  end
  alias :to_entity :to_regular_schedule
end
