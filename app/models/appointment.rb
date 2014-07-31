# == Schema Information
#
# Table name: appointments
#
#  id         :integer          not null, primary key
#  start_time :datetime
#  end_time   :datetime
#  first_name :string(255)
#  last_name  :string(255)
#  comments   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Appointment < ActiveRecord::Base

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates_with AppointmentOverlapValidator
  validates_with AppointmentStartEndTimeValidator

  scope :overlaps, ->(appt) { where("((start_time <= ?) and (end_time >= ?))", appt.end_time, appt.start_time) }

  def overlaps_existing_appointment?
    Appointment.overlaps(self).reject{ |appt| appt == self }.present?
  end
end
