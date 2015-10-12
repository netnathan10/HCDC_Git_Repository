class Pizza < ActiveRecord::Base

  def legit_toppings_yo
    ['cheese', 'olives', 'sausage', 'pepperoni', 'anchovies']
  end

  validates_presence_of :size, :allow_blank => false
  validates_presence_of :delivery, :allow_blank => false
  validates_presence_of :sauce, :allow_blank => false
  validates_presence_of :crust, :allow_blank => false
  validates :toppings, :inclusion => {:in => legit_toppings_yo, :message => 'invalid topping selected' }
  validates :size, :inclusion => {:in => ['small', 'medium', 'large', 'extra_large', 'wumbo'], :message => 'invalid size selected' }
  validates :crust, :inclusion => {:in => ['regular', 'thin'], :message => 'invalid crust selected' }

end
