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
  
end
