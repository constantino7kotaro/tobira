class Lesson < ApplicationRecord

    def user
     return User.find(self.user_id)
    end
    
    def skill
     return Skill.find(self.skill_id)
    end
    
    def area
     return Area.find(self.area_id)
    end
    
    def lesson_type
     return LessonType.find(self.lesson_type_id)
    end
end
