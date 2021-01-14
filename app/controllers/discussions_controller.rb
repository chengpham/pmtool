class DiscussionsController < ApplicationController
    before_action :find_project, only:[:create, :destroy]
    def create
        @discussion = Discussion.new discussion_params
        @discussion.project = @project
        @discussion.save
        redirect_to project_path(@project)
    end
    def destroy
        @discussion=Discussion.find params[:id]
        @discussion.destroy
        redirect_to project_path(@project), notice: "Discussion deleted"
    end
    private
    def discussion_params
        params.require(:discussion).permit(:title, :description)
    end
    def find_project
        @project=Project.find params[:project_id] 
    end
end
