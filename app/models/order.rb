class Order < ApplicationRecord
  has_many :order_item
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum select_address: { own_address: 0, registered_address: 1, new_address: 2 }
  
  
  def address_display
  '〒' + current_customer.postal_code + ' ' + current_customer.address + ' ' + current_customer.last_name + ' ' + current_customer.first_name
  end
  
end
