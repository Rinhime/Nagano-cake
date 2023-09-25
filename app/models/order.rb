class Order < ApplicationRecord
  has_many :order_item
  enum payment_method: { credit_card: 0, transfer: 1 }
  
end
