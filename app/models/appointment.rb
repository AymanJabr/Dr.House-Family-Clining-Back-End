class Appointment < ApplicationRecord
    validates :appointment_begin, uniqueness: true
    validates :appointment_end, uniqueness: true

    belongs_to :user

    scope :appointments_booked, -> { where(booked) }

    def generate_jwt
        JWT.encode({ id: id,
            exp: 60.days.from_now.to_i },
            Rails.application.secrets.secret_key_base)
    end
end
