json.appointment do |json|
  json.partial! 'appointments/appointment', appointment: current_user
end