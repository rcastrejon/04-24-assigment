class Alumno < ApplicationRecord
  validates :id, allow_nil: true, numericality: { only_integer: true, greater_than: 0 }, uniqueness: true
  validates :nombre, presence: true
  validates :matricula, presence: true, uniqueness: true

  normalizes :nombre, with: -> { _1.strip }
  normalizes :matricula, with: -> { _1.strip.upcase }
end
