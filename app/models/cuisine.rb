class Cuisine < ApplicationRecord
  has_many :recipes
  validates :name, presence: { message: 'não pode ficar em branco' }
  validates :name, uniqueness: { message: 'já está em uso' }
end
