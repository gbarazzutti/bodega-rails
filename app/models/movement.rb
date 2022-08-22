class Movement < ApplicationRecord
  belongs_to :product
  MovementTypes = { add: 0, remove: 1 }
  validates :quantity, presence: true, numericality: true

  def self.get_movement_types
    {
      'Agregar' => MovementTypes[:add],
      'Quitar' => MovementTypes[:remove]
    }
  end
end
