class LessonType < ApplicationRecord
    def lesson_type
     return lesson_type.find(self.user_id)
    end
end
