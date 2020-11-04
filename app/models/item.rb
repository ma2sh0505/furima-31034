class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_area
  belongs_to :delivery_burden
  belongs_to :delivery_day
  
end
