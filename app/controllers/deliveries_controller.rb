class DeliveriesController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @orders = @company.get_deliveries(Time.now)
  end
end
