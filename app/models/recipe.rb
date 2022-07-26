class Recipe < ApplicationRecord
    has_many :claps, dependent: :destroy
end