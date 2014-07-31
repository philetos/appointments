json.set! :message, @message

json.appointment do
  json.id           @appointment.id
  json.first_name   @appointment.first_name
  json.last_name    @appointment.last_name
  json.start_time   @appointment.start_time
  json.end_time     @appointment.end_time
  json.created_at   @appointment.created_at
  json.updated_at   @appointment.updated_at
end