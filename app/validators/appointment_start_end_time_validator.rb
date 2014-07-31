class AppointmentStartEndTimeValidator < ActiveModel::Validator
  def validate(record)
    if record.start_time && record.end_time
      if record.start_time > record.end_time
        record.errors.add :appointment_time, "is not valid; Cannot have a start time after the end time."
      end
    end
  end
end