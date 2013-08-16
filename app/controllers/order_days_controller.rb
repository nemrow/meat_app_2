class OrderDaysController < ApplicationController
  def new
    @order_day = OrderDay.new
    @supplier = Supplier.find(params[:supplier_id])
    @days_of_week = days_of_week_options_array
  end

  def create
    order_day = OrderDay.new(params[:order_day])
    supplier = Supplier.find(params[:supplier_id])
    company = supplier.company
    if order_day.save
      supplier.order_days << order_day
      redirect_to edit_company_supplier_path(company, supplier)
    else
      redirect_to new_supplier_order_day_path(supplier, :errors => {:order_day => [Messages.order_day_save_error]})
    end
  end

  def edit

  end
end
