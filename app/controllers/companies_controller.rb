class CompaniesController < ApplicationController
  def new
    @company = Company.new
    @notices = params[:notices]
  end

  def create
    company = Company.new(params[:company])
    if company.save
      current_user.companies << company
      redirect_to company_path(company)
    else
      redirect_to new_company_path(:errors => {'company' => ['could not save company']})
    end
  end

  def show
    @company = Company.find(params[:id])
  end
end
