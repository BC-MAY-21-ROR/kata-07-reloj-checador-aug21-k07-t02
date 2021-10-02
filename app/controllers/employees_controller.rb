class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update destroy]

  def index
    @employees = Employee.all
  end

  def show; end

  def new
    @employee = Employee.new
  end

  def edit; end

  def create
    @employee = Admin.first.employees.new(employee_params)
    return render :new, status: :unprocessable_entity unless @employee.save

    redirect_to @employee, notice: 'Employee was successfully created.'
  end

  def update
    return render :edit, status: :unprocessable_entity unless @employee.update(employee_params)

    redirect_to employee_path, notice: 'Employee was successfully updated.'
  end

  def destroy
    @employee.destroy
    redirect_to employees_url, notice: 'Employee was successfully destroyed.'
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:email, :name, :position, :private_number, :active, :admin_id, :store_id)
  end
end
