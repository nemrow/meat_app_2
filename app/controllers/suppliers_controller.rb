class SuppliersController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @supplier = Supplier.new
    @page_header = 'Add New Supplier'
    @errors = params[:errors][:supplier] if params[:errors]
  end

  def create
    company = Company.find(params[:company_id])
    supplier = Supplier.new(params[:supplier])
    if supplier.save
      company.suppliers << supplier
      redirect_to edit_company_supplier_path(company, supplier)
    else  
      redirect_to new_company_supplier_path(company, :errors => {:supplier => supplier.errors.messages})
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @supplier = Supplier.find(params[:id])
    @products = @supplier.products
    @order_days = @supplier.order_days
    @page_header = "Update #{@supplier.name}"
    @errors = params[:errors][:product] if params[:errors]
  end

  def update
    company = Company.find(params[:company_id])
    supplier = Supplier.find(params[:id])
    if supplier.update_attributes(params[:supplier])
      redirect_to company_suppliers_path(company)
    else
      redirect_to edit_company_supplier_path(company, supplier, :errors => {:supplier => supplier.errors.messages})
    end
  end

  def index
    @company = Company.find(params[:company_id])
    @suppliers = @company.suppliers
    @page_header = "Manage Suppliers"
  end

  def show
    @company = Company.find(params[:company_id])
    @supplier = Supplier.find(params[:id])
    @products = @supplier.products
    @order_days = @supplier.order_days
  end
end
