class FutureAppointmentValidator < ActiveModel::Validator
  def validate(record)
    if record.start_time && record.end_time
      if record.start_time < Time.now
        record.errors.add :appointment_time, "must be set in the future"
      end
    end
  end
end