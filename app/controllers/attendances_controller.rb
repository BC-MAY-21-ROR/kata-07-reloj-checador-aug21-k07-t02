require 'awesome_print'
class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[show edit update destroy]

  def index
    @attendances = Attendance.all
  end

  def show; end

  def new
    @attendance = Attendance.new
  end

  def edit; end

  def create
    employee = Employee.find_by(private_number: attendance_params[:private_number].to_i)
    @attendance = Attendance.new(attendance_params)
    @attendance.employee_id = employee.id
    return render :new, status: :unprocessable_entity unless @attendance.save

    redirect_to @attendance, notice: 'Attendance was successfully created.'
  end

  def update
    return render :edit, status: :unprocessable_entity unless @attendance.update(attendance_params)

    redirect_to @attendance, notice: 'Attendance was successfully updated.'
  end

  private

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:check_in, :check_out, :private_number)
  end
end
