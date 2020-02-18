class StaffsController < ApplicationController
  def index
  	@company = Company.find(params[:company_id])
  	@staffs  = @company.staffs
  end
   def new
    @company = Company.find(params[:company_id])
    @staff = Staff.new
  end

  def create
    @company = Company.find(params[:company_id])
    @staff = Staff.new(staff_params)
    if @staff.save
      redirect_to company_staffs_path(@company)
    end
  end

  def staff_params
    params.require(:staff).permit(:name, :title, :company_id)
  end
  def edit
    @company = Company.find(params[:company_id])
    @staff = Staff.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @staff = Staff.find(params[:id])
    if @staff.update(staff_params)
      redirect_to company_staffs_path(@company)
    end
  end
    def show
    @company = Company.find(params[:company_id])
    @staff = Staff.find(params[:id])
    end
  

  def destroy
    @company = Company.find(params[:company_id])
    @staff = Staff.find(params[:id])
    if @staff.destroy
      redirect_to company_staffs_path(@company)
    end
  end
end
