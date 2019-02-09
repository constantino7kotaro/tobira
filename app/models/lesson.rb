class Lesson < ApplicationRecord
    def user
     return User.find(self.user_id)
    end
end
