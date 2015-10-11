class AddDeliveryToPizza < ActiveRecord::Migration
  def change
    add_column :pizzas, :delivery, :boolean
  end
end
