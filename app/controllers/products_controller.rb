class ProductsController < ApplicationController
  def new
    @supplier = Supplier.find(params[:supplier_id])
    @product = Product.new
    @page_header = "Add Product"
    @errors = params[:errors][:product] if params[:errors]
  end

  def create
    product = Product.new(params[:product])
    supplier = Supplier.find(params[:supplier_id])
    company = supplier.company
    if product.save
      supplier.products << product
      redirect_to edit_company_supplier_path(company, supplier)
    else
      redirect_to new_supplier_product_path(supplier, :errors => {:product => product.errors.messages})
    end
  end

  def edit
    @product = Product.find(params[:id])
    @supplier = @product.supplier
    @errors = params[:errors][:product] if params[:errors]
  end

  def update
    product = Product.find(params[:id])
    supplier = product.supplier
    company = supplier.company
    if product.update_attributes(params[:product])
      redirect_to edit_company_supplier_path(company, supplier)
    else
      redirect_to edit_supplier_product_path(supplier, product, :errors => {:product => product.errors.messages})
    end
  end

  def destroy
    product = Product.find(params[:id])
    supplier = product.supplier
    company = supplier.company
    if product.destroy
      redirect_to edit_company_supplier_path(company, supplier)
    else
      redirect_to edit_company_supplier_path(company, supplier, :errors => {:product => [Messages.product_destroy_error]})
    end
  end
end
