class OrderDaysController < ApplicationController
  def new
    @order_day = OrderDay.new
    @supplier = Supplier.find(params[:supplier_id])
    @days_of_week = days_of_week_options_array
    @page_header = 'Add Order / Delivery Days'
    @errors = params[:errors][:order_day] if params[:errors]
  end

  def create
    order_day = OrderDay.new(params[:order_day])
    supplier = Supplier.find(params[:supplier_id])
    company = supplier.company
    if order_day.save
      supplier.order_days << order_day
      redirect_to edit_company_supplier_path(company, supplier)
    else
      redirect_to new_supplier_order_day_path(supplier, :errors => {:order_day => order_day.errors.messages})
    end
  end

  def edit
    @order_day = OrderDay.find(params[:id])
    @supplier = Supplier.find(params[:supplier_id])
    @days_of_week = days_of_week_options_array
  end

  def update
    supplier = Supplier.find(params[:supplier_id])
    company = supplier.company
    order_day = OrderDay.find(params[:id])
    if order_day.update_attributes(params[:order_day])
      redirect_to edit_company_supplier_path(company, supplier)
    else
      # WIP
    end
  end

  def destroy
    order_day = OrderDay.find(params[:id])
    supplier = Supplier.find(params[:supplier_id])
    company = supplier.company
    if order_day.destroy
      redirect_to edit_company_supplier_path(company, supplier)
    else 

    end
  end
end
