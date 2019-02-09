class Lesson < ApplicationRecord
    validates :user_id, {presence: true, uniqueness: true}
    validates :skill_id, {presence: true}
    validates :area_id, {presence: true}
    validates :lesson_type_id, {presence: true}
    validates :content, {length: {maximum: 140}}
    
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
