class Product < ApplicationRecord
  PER_PAGE = 250

  belongs_to :category

  serialize :metadata

  has_one_attached :image
end
