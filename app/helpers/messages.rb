module Messages
  def self.welcome(name)
    "Welcome to the Meat App #{name}!"
  end

  def not_owner
    "You do not have permission to view this page! Go away, or login to the correct account. Peace."
  end

  def product_save_error
    "could not save product"
  end

  def order_day_save_error
    "could not save order day"
  end

  def product_edit_error
    "could not update product"
  end

  def product_destroy_error
    "could not delete this product"
  end

  def delete_product
    "If you delete this product, all of its orders and inventory history will be lost as well"
  end

  def inventory_success(supplier)
    "Inventory for #{supplier.name} Successfully Updated"
  end

  def inventory_fail(supplier)
    "Could not update inventory for #{supplier.name}. Please try again"
  end

  def order_success(supplier)
    "Order for #{supplier.name} successfully taken"
  end

  def order_fail(supplier)
    "Could not take order for #{supplier.name}. Please try again."
  end

end