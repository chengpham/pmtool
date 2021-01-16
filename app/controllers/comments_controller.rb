class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_project, only:[:create, :destroy]
    before_action :find_discussion, only:[:create, :destroy]
    def create
        @comment = Comment.new comment_params
        @comment.project = @project
        @comment.discussion = @discussion
        @comment.user = current_user
        @comment.save
        redirect_to project_path(@project)
    end
    def destroy
        @comment = Comment.find params[:id]
        @comment.destroy
        redirect_to project_path(@project), notice: "Comment deleted"
    end
    private
    def comment_params
        params.require(:comment).permit(:body)
    end
    def find_project
        @project=Project.find params[:project_id] 
    end
    def find_discussion
        @discussion=Discussion.find params[:discussion_id] 
    end
end
