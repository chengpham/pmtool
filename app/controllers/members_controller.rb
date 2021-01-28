class MembersController < ApplicationController
    before_action :authenticate_user!

    def create
        puts "Members:---------------------#{member_params[:members_name]}"
        puts "project:---------------------#{params[:project_id]}"
        member_params[:members_name].split(',').each do |email|
            user=User.find_by_email(email)
            Member.create(project_id: params[:project_id], user_id: user.id)
        end
        # user = User.where(member_params[:users])
        # puts "User:---------------------#{user}"
        # user.each do |u|
        #     puts "User:---------------------#{u}"
        # end
        # @member = Member.new member_params
        # @member.project = @project
        # @member.user = current_user
        # @member.save
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



User.where("first_name ILIKE ? OR last_name ILIKE ?", "%rick%","%rick% ")