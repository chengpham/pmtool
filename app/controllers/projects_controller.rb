class ProjectsController < ApplicationController
    before_action :find_project, only:[:show, :edit, :update, :destroy]
    def index
        @projects=Project.all.order(created_at: :desc)
    end
    def show
        @project_id=params[:id]
        @task=Task.new
        @discussion=Discussion.new
        @comment=Comment.new
        @discussions=@project.discussions.order(created_at: :desc)
        @task_done=@project.tasks.where(done: true)
        @task_undone=@project.tasks.where(done: false)
    end
    def destroy
        @project.destroy
        redirect_to projects_path
    end
    def new
        @project=Project.new
    end
    def create
        @project=Project.new project_params
        @project.user = current_user
        if @project.save
            redirect_to project_path(@project.id)
        else
            render :new
        end
    end
    def edit
    end
    def update
        if @project.update project_params
            redirect_to project_path(@project.id)
        else
            render :edit
        end
    end
    private
    def find_project
        @project=Project.find params[:id] 
    end
    def project_params
        params.require(:project).permit(:title, :description, :due_date)
    end
end
