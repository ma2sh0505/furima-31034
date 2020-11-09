class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :post_code
    validates :prefecture_id, numericality: { other_than: 1}
    validates :city
    validates :house_number
    validates :phon_number
  end
end
