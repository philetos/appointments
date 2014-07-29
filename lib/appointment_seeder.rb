class AppointmentSeeder

  attr_accessor :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def self.seed(file_path)
    new(file_path).seed!
  end

  def seed!
    create_appointments_from_csv
    log_seeded_database_message
  end

  private 

  def create_appointments_from_csv
    CSV.foreach(file_path, headers: true) do |row|
      Appointment.create!(
        start_time: DateTime.strptime(row[0], "%m/%d/%Y %H:%M"),
        end_time:   DateTime.strptime(row[1], "%m/%d/%Y %H:%M"),
        first_name: row[2],
        last_name:  row[3],
        comments:   row[4]
      )
    end
  end

  def log_seeded_database_message
    Rails.logger.info "============================================================="
    Rails.logger.info " database seeded with data from #{file_path} "
    Rails.logger.info "============================================================="

    puts "============================================================="
    puts " database seeded with data from #{file_path} "
    puts "============================================================="
  end 
end