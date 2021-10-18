require 'awesome_print'
class AttendancesController < ApplicationController

  def index
    @attendances = Attendance.all
  end

  def show; end

  def new
    @attendance = Attendance.new
  end

  def edit
    employee = Employee.find_by(private_number: attendance_params[:private_number].to_i)
    if employee.nil?
      @attendance = Attendance.find(params[:id])
    else
      attendance = employee.attendances.last
      @attendance = Attendance.find(attendance.id)
    end
  end 

  def create
    employee = Employee.find_by(private_number: attendance_params[:private_number].to_i)

    if !employee.nil?
      ap '*' * 125
      @attendance = Attendance.new
      @attendance.employee_id = employee.id
      @attendance.check_in = Time.now
      @attendance.save
      redirect_to root_path, notice: 'Attendance was successfully created.'   
    elsif employee.nil?
      Attendance.new(attendance_params).save
      ap '!' * 125
      redirect_to root_path, notice: 'Attendance was successfully created.'   
    else
      ap '@' * 125
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def update
    ap '=======================> update @' * 125
    employee = Employee.find_by(private_number: attendance_params[:private_number].to_i)
    if employee.nil?
      attendance = Attendance.find(params[:id])
    else
      attendance = employee.attendances.last
    end

    return render :root_path, status: :unprocessable_entity unless attendance.update(check_out: Time.now)

    redirect_to root_path, notice: 'Attendance was successfully updated.'
  end

  private

  def attendance_params
    params.permit(:check_in, :check_out, :private_number, :button, :authenticity_token, :commit)
  end
end
