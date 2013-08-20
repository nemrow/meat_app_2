class OrdersController < ApplicationController
  def index
    @supplier = Supplier.find(params[:supplier_id])
    @company = @supplier.company
    @orders = @supplier.get_or_create_todays_suppliers_orders
  end

  def supplier_list
    @company = Company.find(params[:company_id])
    @suppliers = @company.get_ordering_suppliers(Time.now)
  end

  def update_supplier_line
    supplier = Supplier.find(params[:supplier_id])
    Order.update_from_order_form(params[:order])
    redirect_to supplier_orders_path(supplier)
  end
end

