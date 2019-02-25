class User < ApplicationRecord
    has_secure_password
    validates :nickname, {presence: true, uniqueness: true}
    validates :email, {presence: true, uniqueness: true}
    validates :password_digest, {presence: true, length: {greater_than_or_equal_to: 8}}
end
