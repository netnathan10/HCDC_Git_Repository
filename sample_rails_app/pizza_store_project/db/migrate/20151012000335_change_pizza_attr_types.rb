class ChangePizzaAttrTypes < ActiveRecord::Migration
  def change
    change_column :pizzas, :toppings, :string
    change_column :pizzas, :size, :string
    change_column :pizzas, :sauce, :string
    change_column :pizzas, :crust, :string
  end
end
