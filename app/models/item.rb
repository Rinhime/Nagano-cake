class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  
  def get_image(width, height)
     unless image.attached?
       file_path = Rails.root.join('app/assets/images/no_image.jpg')
       image.attach(io: File.open(file_path), filename: 'default=image.jpg', content_type: 'image/jpeg')
     end
     image.variant(resize_to_limit: [width,height]).processed
  end
  
  def add_tax_price
    (self.price * 1.10).round
  end
  
  def with_tax_price
    (price * 1.1).floor
  end
    
  def total_item_amount #アイテム合計金額
   order_details.sum { |order_detail| order_detail.subtotal }
  end
end
