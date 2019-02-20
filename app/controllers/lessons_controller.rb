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
        @lesson = Lesson.new(user_id: 1,
                         area_id: params[:lesson][:area_id], 
                         skill_id: params[:lesson][:skill_id], 
                         lesson_type_id: params[:lesson][:lesson_type_id], 
                         content: params[:lesson][:content])
        if @lesson.save
            redirect_to("/lessons/#{@lesson.id}")
            flash[:notice] = "ホスト登録が完了しました"
        else
            render("lessons/new")
        end
    end
    
    def destroy
        @lesson = Post.find(params[:id])
        @lesson.destroy
    end
end
