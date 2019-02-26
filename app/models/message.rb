class Message < ApplicationRecord
    def sent_user_id
     return User.find(self.sent_user_id)
    end
    
    def recieved_user_id
     return User.find(self.recieved_user_id)
    end
end
