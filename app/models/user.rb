class User < ApplicationRecord
    has_secure_password
    has_many :claps, dependent: :destroy
end
