class User < ApplicationRecord
    has_secure_password
    has_many :claps, dependent: :destroy

    validates :email, format: {with: ^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$, message: 'solo formato email'}
end
