class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to companies_path
    end
  end
  def company_params
    params.require(:company).permit(:name, :description)
  end
  def show
    @company = Company.find(params[:id])
  end
  def edit
    @company = Company.find(params[:id])
     
  end
  def update
    @company = Company.find(params[:id])
    @company = @company.update(company_params)
    redirect_to companies_path
  end
   def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end
end
