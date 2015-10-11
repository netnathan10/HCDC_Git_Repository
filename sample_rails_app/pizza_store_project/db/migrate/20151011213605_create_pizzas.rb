class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string :toppings
      t.integer :size
      t.integer :sauce
      t.integer :crust

      t.timestamps null: false
    end
  end
end
