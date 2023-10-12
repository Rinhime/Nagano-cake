class Order < ApplicationRecord
  has_many :order_items
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  def address_display
  '〒' + current_customer.postal_code + ' ' + current_customer.address + ' ' + current_customer.last_name + ' ' + current_customer.first_name
  end
  
  SIPPING_COST = 800
  
end
