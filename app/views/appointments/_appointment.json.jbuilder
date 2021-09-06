json.(appointment, :id, :user, :appointment_begin, :appointment_end, :booked)
json.token appointment.generate_jwt