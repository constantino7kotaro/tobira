class LessonsController < ApplicationController
    def index
        @lessons = Lesson.all.order("updated_at DESC")
    end
    
    def show
        @lesson = Lesson.find(params[:id])
    end
    
    def new
        @lesson = Lesson.new
    end
    
    def create
        @lesson = Lesson.new(area: params[:lesson][:area_id], 
                         skill: params[:lesson][:skill_id], 
                         lesson_type: params[:lesson][:lesson_type_id], 
                         content: params[:lesson][:content])
        if @lesson.save
            redirect_to("/lessons/#{@lesson.id}")
            flash[:notice] = "ホスト登録が完了しました"
        else
            render("lessons/new")
        end
    end
end
