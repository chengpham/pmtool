# [PM Tool] Members
# Add the ability to add one or more members (users in the system) to your projects. List all the members of the project in the display page.

class ProjectsController < ApplicationController
    before_action :find_project, only:[:show, :edit, :update, :destroy]
    def index
        if params[:tag]
            @tag=Tag.find_or_initialize_by(name: params[:tag])
            @projects=@tag.projects.order(created_at: :desc)
        else
            @projects=Project.all.order(created_at: :desc)
        end
        
    end
    def show
        @project_id=params[:id]
        @task=Task.new
        @discussion=Discussion.new
        @comment=Comment.new
        @member=Member.new
        @discussions=@project.discussions.order(created_at: :desc)
        @task_done=@project.tasks.where(done: true)
        @task_undone=@project.tasks.where(done: false)
        @favourite = @project.favourites.find_by_user_id current_user if user_signed_in?
    end
    def destroy
        @project.destroy
        flash[:danger]= 'deleted project'
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
        params.require(:project).permit(:title, :description, :due_date, :tag_names)
    end
end
