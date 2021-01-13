class DiscussionsController < ApplicationController
    def index
        @discussions=Discussion.all.order(created_at: :desc)
    end
end
