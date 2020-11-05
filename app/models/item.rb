class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_area
  belongs_to :delivery_burden
  belongs_to :delivery_day

   with_options presence: true do
     validates :name
     validates :introduction
     validates :price, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999 }
     validates :image
      with_options  numericality: { other_than: 1} do
       validates :category_id
       validates :condition_id
       validates :delivery_area_id
       validates :delivery_burden_id
       validates :delivery_day_id
      end
   end
end
