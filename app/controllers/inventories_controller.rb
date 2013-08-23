class InventoriesController < ApplicationController
  def index
    @supplier = Supplier.find(params[:supplier_id])
    @company = @supplier.company
    @inventories = @supplier.get_or_create_todays_suppliers_inventories
    @notices = params[:notices] if params[:notices]
    @page_header = "Inventory for #{@supplier.name}"
  end

  def supplier_list
    @company = Company.find(params[:company_id])
    @suppliers = @company.suppliers
    @notices = params[:notices] if params[:notices]
    @page_header = "Take Inventory"
  end

  def update_supplier_line
    supplier = Supplier.find(params[:supplier_id])
    company = supplier.company
    if Inventory.update_from_inventory_form(params[:inventory])
      redirect_to supplier_list_company_inventories_path(company, :notices => [Messages.inventory_success(supplier)])
    else
      redirect_to supplier_inventories_path(supplier, :errors => [:inventory => Messages.inventory_fail])
    end
  end
end
