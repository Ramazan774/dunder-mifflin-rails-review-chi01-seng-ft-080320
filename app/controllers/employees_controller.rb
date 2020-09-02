class EmployeesController < ApplicationController

    def index
        @employees = Employee.all 
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
    end

    def edit
        @employee = Employee.find(params[:id])
        redirect_to new_employee_path
    end

    def create
        employee = Employee.new(employee_params)
        if employee.save
            redirect_to employee_path(employee)
        else
            flash[:errors] = employee.errors.full_messages
            redirect_to new_employee_path
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :office, :dog_id, :img_url)
    end
end
