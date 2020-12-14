class Product < ApplicationRecord
  PER_PAGE = 250

  belongs_to :category, counter_cache: true, touch: true

  serialize :metadata

  has_one_attached :image
end
