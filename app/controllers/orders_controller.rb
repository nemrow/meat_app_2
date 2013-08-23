class OrdersController < ApplicationController
  def index
    @supplier = Supplier.find(params[:supplier_id])
    @company = @supplier.company
    @orders = @supplier.get_or_create_todays_suppliers_orders
  end

  def supplier_list
    @company = Company.find(params[:company_id])
    @suppliers = @company.get_ordering_suppliers(Time.now)
    @notices = params[:notices] if params[:notices]
  end

  def update_supplier_line
    supplier = Supplier.find(params[:supplier_id])
    company = supplier.company
    if Order.update_from_order_form(params[:order])
      redirect_to supplier_list_company_orders_path(company, :notices => [Messages.order_success(supplier)])
    else
      redirect_to supplier_orders_path(supplier, :errors => [:order => Messages.order_fail(supplier)])
    end
  end
end

