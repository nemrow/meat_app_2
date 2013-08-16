class ProductsController < ApplicationController
  def new
    @supplier = Supplier.find(params[:supplier_id])
    @product = Product.new
  end

  def create
    product = Product.new(params[:product])
    supplier = Supplier.find(params[:supplier_id])
    company = supplier.company
    if product.save
      supplier.products << product
      redirect_to edit_company_supplier_path(company, supplier)
    else
      redirect_to new_supplier_product_path(supplier, :errors => {:product => [Messages.product_save_error]})
    end
  end

  def edit
    @product = Product.find(params[:id])
    @supplier = @product.supplier
  end

  def update
    product = Product.find(params[:id])
    supplier = product.supplier
    company = supplier.company
    if product.update_attributes(params[:product])
      redirect_to edit_company_supplier_path(company, supplier)
    else

    end
  end

  def destroy
  end
end
