class Recipe < ApplicationRecord
    has_many :claps, dependent: :destroy
    belongs_to :category
end