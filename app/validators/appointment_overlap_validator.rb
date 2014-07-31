class AppointmentOverlapValidator < ActiveModel::Validator
  def validate(record)
    if record.start_time && record.end_time
      if record.overlaps_existing_appointment?
        record.errors.add(:appointment_time, "overlaps an existing appointment")
      end
    end
  end
end