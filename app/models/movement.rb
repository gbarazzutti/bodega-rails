class Movement < ApplicationRecord
  belongs_to :product
  MovementsTypes = { add: 0, remove: 1 }
  validates :quantity, presence: true, numeracality: true
end
