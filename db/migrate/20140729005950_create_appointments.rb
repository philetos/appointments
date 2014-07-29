class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string   :first_name
      t.string   :last_name
      t.string   :comments

      t.timestamps
    end

    add_index :appointments, [:id, :start_time, :end_time]
  end
end
