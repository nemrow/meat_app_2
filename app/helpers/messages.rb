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
end