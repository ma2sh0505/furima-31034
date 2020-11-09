class OrderAddress 
  include ActiveModel::ActiveModel
  atter_accessor  :post_code, :prefecture_id, :city, :house_number, :building_number, :phon_number

  with_options presence: true do
   validates :post_code
   validates :prefecture_id, numericality: { other_than: 1}
   validates :city
   validates :house_number
   validates :phon_number
 end

 def save
   order = Order.create
   Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_number: building_number, phon_number: phon_number, order_id: order_id)
 end
end