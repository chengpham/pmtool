class Api::V1::ProjectsController < Api::ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_project, only:[:show, :destroy, :update]
    before_action :authorize_user!, only:[:edit, :update, :destroy]

    def index 
        projects= Project.order created_at: :desc
        render json: projects , each_serializer: ProjectCollectionSerializer
    end
    def show
        render json: @project
    end
    def destroy
        if @project.destroy
            head :ok
        else
            head :bad_request
        end
    end
    def create
        project=Project.new project_params
        project.user=current_user
        if project.save
            render json:{id: project.id}
        else
            render(
                json: {errors: project.errors},
                status: 422
            )
        end
    end
    def update
        if @project.update project_params
            render json: {id: @project.id}
        else
            render(
                json: {errors: @project.errors},
                status: 422
            )
        end
    end
    private
    def find_project
        @project=Project.find params[:id]
    end
    def project_params
        params.require(:project).permit(:title, :description, :due_date)
    end
    def authorize_user!
        render(json: {status: 404}, status: 404) unless can?(:crud, @project)
    end
end
