# frozen_string_literal: true
class Product < ApplicationRecord
  has_many :movements, dependent: :destroy
  validates :name, presence: true

  def quantity
    total = 0
    movements.each do |movement|
      if movement.movement_type == Movement::MovementTypes[:add]
        total += movement.quantity
      else
        total -= movement.quantity
      end
    end
    total
  end
end
