class TasksController < ApplicationController
    before_action :require_user_logged_in
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    def index
        @tasks = Task.all
    end
    
    def show
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = current_user.tasks.build(task_params)
        
        if @task.save
            flash[:success] = 'Task が正常に入力されました'
            redirect_to root_url
        else
            @task = current_user.tasks.build.order(id: desc).page(params[:page])
            flash.now[:danger] = 'Task が正しく入力されませんでした'
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @task.update(task_params)
            flash[:success] = 'Task は正常に更新されました'
            redirect_to root_url
        else
            flash.now[:danger] = 'Task は更新させませんでした'
            render :edit
        end
    end
    
    def destroy
        @task.destroy
        
        flash[:success] = 'Task は正常に削除されました'
        redirect_to root_url
    end
    
    private
    
    def set_task
        @task = Task.find(params[:id])
    end
    
    #Strong Parameter
    def task_params
        params.require(:task).permit(:content, :status)
    end
    
end
