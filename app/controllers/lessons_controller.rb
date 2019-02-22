class LessonsController < ApplicationController
    before_action :authenticate_user
    
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
    
    def destroy_form
    end
    
    def destroy
        @lesson = Lesson.find(params[:id])
        @lesson.destroy
        redirect_to("/lessons/index")
    end
    
    def search_area
        #@areas = Area.all
        @a = Area.search(params[:a])
        @areas = @a.result(distinct: true)
    end
    
    def search_skill
        #@skills = Skill.all
        @s = Skill.search(params[:s])
        @skills = @s.result(distinct: true)
    end
    
    #NOTE:キーワード検索は？？
    def search_keyword
    end
end
