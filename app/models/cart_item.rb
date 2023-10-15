class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  def subtotal
    item.with_tax_price * amount
  end
  
  def total_price
    item.to_a.sum { |item| item.total_price }
  end

  def sum_of_price
    item.with_tax_price * amount
  end  
  
  validates :item_id, presence: true
  validates :customer_id, presence: true
  validates :amount, presence: true
end
