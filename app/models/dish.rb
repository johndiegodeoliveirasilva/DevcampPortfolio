class Dish < ApplicationRecord

  has_one_attached :avatar
  has_and_belongs_to_many :ingredients
end
