class User < ApplicationRecord
    validates :nickname, {presence: true, uniqueness: true}
    validates :introduction, {presence: true}
end
