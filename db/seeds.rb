require 'csv'  
require 'appointment_seeder'  


unless Appointment.exists?
  AppointmentSeeder.seed("#{Rails.root}/tmp/appt_data.csv")
end