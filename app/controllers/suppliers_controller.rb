class SuppliersController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @supplier = Supplier.new
  end

  def create
    company = Company.find(params[:company_id])
    supplier = Supplier.new(params[:supplier])
    if supplier.save
      company.suppliers << supplier
      redirect_to edit_company_supplier_path(company, supplier)
    else  
      redirect_to root_path
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @supplier = Supplier.find(params[:id])
    @products = @supplier.products
    @order_days = @supplier.order_days
  end

  def update
    company = Company.find(params[:company_id])
    supplier = Supplier.find(params[:id])
    supplier.update_attributes(params[:supplier])
    redirect_to company_suppliers_path(company)
  end

  def index
    @company = Company.find(params[:company_id])
    @suppliers = @company.suppliers
  end

  def show
    @company = Company.find(params[:company_id])
    @supplier = Supplier.find(params[:id])
    @products = @supplier.products
    @order_days = @supplier.order_days
  end
end
