class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :billing, optional: true

  scope :cart, -> {where(payed: false)}
  scope :payed, -> {where(payed: true)}
  
  def self.get_total
 	pluck("price * quantity").sum()
  end 

  def self.total_quantity
  	pluck("quantity").sum()
  end

 
end
