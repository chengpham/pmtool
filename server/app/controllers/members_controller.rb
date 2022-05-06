class MembersController < ApplicationController
    before_action :authenticate_user!

    def create
        member_params[:members_name].split(',').each do |email|
            user=User.find_by_email(email)
            Member.create(project_id: params[:project_id], user_id: user.id)
        end
        redirect_to project_path(params[:project_id]), notice: "member added"
    end
    def destroy
        @member = Member.find params[:id]
        @member.destroy
        redirect_to project_path(@project), notice: "member deleted"
    end
    private
    def member_params
        params.require(:member).permit(:members_name)
    end
end
