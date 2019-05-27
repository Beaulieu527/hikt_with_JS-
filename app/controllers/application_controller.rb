class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :authenticate_user!  
    
    def set_hike
        @hike = Hike.find(params[:hike_id])
    end
end
