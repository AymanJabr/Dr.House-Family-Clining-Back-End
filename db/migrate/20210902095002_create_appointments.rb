class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.datetime :appointment_begin
      t.datetime :appointment_end
      t.boolean :booked
      t.timestamps
    end
  end
end
