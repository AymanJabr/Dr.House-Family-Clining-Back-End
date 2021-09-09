class AppointmentController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = current_user.id == 1 ? Appointment.all : current_user.appointments
    render json: @appointments
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: { errors: @appointment.errors }, status: :unprocessable_entity
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    render json: @appointment
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: { errors: @appointment.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    head :ok
  end

  private

  def appointment_params
    params.require(:appointment).permit(:user_id, :appointment_begin, :appointment_end, :booked)
  end
end