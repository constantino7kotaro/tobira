class LessonsController < ApplicationController
    def index
        @lessons = Lesson.all.order("updated_at DESC")
    end
end
