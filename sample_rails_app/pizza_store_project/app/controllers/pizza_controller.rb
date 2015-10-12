class PizzaController < ApplicationController

  def create_order
    @pizza = Pizza.new(params[:pizza])
    @toppings_array = @pizza.toppings.split(',')
    @pizza.price = @pizza.calculate_price

    if @pizza.save
      # Go to order-review form (doesn't exist yet)
    else
      # Throw an error
    end
  end
end
