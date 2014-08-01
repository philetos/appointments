class Api::AppointmentsController < Api::ApplicationController 

  before_filter :api_authentication_required

  def list
    populate_appointments
    render template: 'api/appointments/list', status: :ok
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      @message = "This appointment has successfully been created"
      render template: 'api/appointments/show', status: :created
    else
      message = "Unable to create this appointment"
      render json: { message: message, errors: @appointment.errors }, status: :unprocessable_entity
    end
  end

  def update
    @appointment  = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      @message = "This appointment has successfully been updated"
      render template: 'api/appointments/show', status: :ok
    else
      message = "Unable to update this appointment"
      render json: { message: message, errors: @appointment.errors, appointment: @appointment }, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment  = Appointment.find(params[:id])
    @appointment.destroy

    @message = "This appointment has successfully been deleted"
    render template: 'api/appointments/show', status: :ok
  end

  protected

  def appointment_params
    params.permit(:start_time, :end_time, :first_name, :last_name, :comments)
  end

  def populate_appointments
    if params[:start_time_filter]
      @filter = {type: :start_time, param: params[:start_time_filter]}
      @appointments = Appointment.where(start_time: params[:start_time_filter])
    elsif params[:end_time_filter]
      @filter = {type: :end_time, param: params[:end_time_filter]}
      @appointments = Appointment.where(end_time: params[:end_time_filter])
    else
      @appointments = Appointment.all
    end  
  end
end
