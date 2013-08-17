class InventoriesController < ApplicationController
  def index
    @supplier = Supplier.find(params[:supplier_id])
    @company = @supplier.company
    @inventories = @supplier.get_or_create_todays_suppliers_inventories
  end

  def supplier_list
    @company = Company.find(params[:company_id])
    @suppliers = @company.suppliers
  end

  def update_supplier_products
    supplier = Supplier.find(params[:supplier_id])
    Inventory.update_from_inventory_form(params[:inventory])
    redirect_to supplier_inventories_path(supplier)
  end
end
