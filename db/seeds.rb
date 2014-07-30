require 'csv'  
require 'appointment_seeder'  


unless Appointment.exists?
  AppointmentSeeder.seed("#{Rails.root}/doc/data/appt_data.csv")
end