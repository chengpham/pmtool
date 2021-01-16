class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :find_project, only:[:create, :update, :destroy]
    before_action :find_task, only:[ :update, :destroy]
    def create
        @task = Task.new task_params
        @task.project = @project
        @task.user = current_user
        @task.save
        redirect_to project_path(@project)
    end
    def destroy
        @task.destroy
        redirect_to project_path(@project), notice: "Task deleted"
    end
    def update
        @task.done = true
        @task.save
        redirect_to project_path(@project)
        
    end
    private
    def task_params
        params.require(:task).permit(:title, :due_date)
    end
    def task_done_params
        params.require(:task).permit(:done)
    end
    def find_project
        @project=Project.find params[:project_id] 
    end
    def find_task
        @task=Task.find params[:id] 
    end
end
