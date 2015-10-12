class Pizza < ActiveRecord::Base

  validates_presence_of :size, :allow_blank => false
  validates_presence_of :delivery, :allow_blank => false
  validates_presence_of :sauce, :allow_blank => false
  validates_presence_of :crust, :allow_blank => false
  # validates :toppings, :inclusion => {:in => legit_toppings_yo, :message => 'invalid topping selected' }
  # validates :size, :inclusion => {:in => sizes.keys, :message => 'invalid size selected' }
  # validates :crust, :inclusion => {:in => crust.keys, :message => 'invalid crust selected' }

  def legit_toppings_yo
    return ['cheese', 'olives', 'sausage', 'pepperoni', 'anchovies']
  end

  def sizes
    {
      'small' => 1.0,
      'medium' => 2.0,
      'large' => 3.0,
      'extra_large' => 4.0,
      'wumbo' => 5.0
    }
  end

  def crust
    {
      'regular' => 1.0,
      'thin' => 1.50
    }
  end

  def calculate_price
    price = 4.99
    price += (toppings.size * 0.50)
    price += sizes['size']
    price += crust['crust']
    return price
  end
end
