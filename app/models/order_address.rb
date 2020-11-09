class OrderAddress 
  include ActiveModel::Model
  attr_accessor  :post_code, :prefecture_id, :city, :house_number, :building_number, :phon_number, :user_id, :item_id

  with_options presence: true do
   validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
   validates :prefecture_id, numericality: { other_than: 1}
   validates :city
   validates :house_number
   validates :phon_number,format: { with: /\A[0-9]\z/}
  end

 def save
   order = Order.create(user_id: user_id,item_id: item_id)
   Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_number: building_number, phon_number: phon_number, order_id: order.id)
 end
end