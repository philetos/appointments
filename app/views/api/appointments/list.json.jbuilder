if @filter
  json.set! :filter do
    json.by @filter[:type]
    json.param @filter[:param]
  end
end

json.set! :appointments do
  json.array! @appointments do |appt|
    json.id           appt.id
    json.first_name   appt.first_name
    json.last_name    appt.last_name
    json.start_time   appt.start_time
    json.end_time     appt.end_time
  end
end