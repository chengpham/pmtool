class MembersController < ApplicationController
    before_action :authenticate_user!

    def create
        puts "Members:---------------------#{member_params[:members_name]}"
        # user = User.search_by_name(member_params[:users])
        # puts "User:---------------------#{user.id}"
        # user.each do |u|
        #     puts "User:---------------------#{u}"
        # end
        # @member = Member.new member_params
        # @member.project = @project
        # @member.user = current_user
        # @member.save
        redirect_to project_path(26), notice: "member added"
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