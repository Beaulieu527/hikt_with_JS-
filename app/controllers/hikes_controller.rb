class HikesController < ApplicationController
    before_action :authenticate_user! 
 
    def index
        @hikes = Hike.all
    end

    def new
        @hike = Hike.new

    end
    
    def create
        hike = Hike.create(hike_params)
        redirect_to hikes_path
    end
    
    def show
        @hike = Hike.find(params[:id])
    end

    def edit
        @hike = Hike.find(params[:id])
    end

    def update
        hike = Hike.find(params[:id])
        hike.update(hike_params)
        hike.save
        redirect_to hikes_path
    end

    def destroy
        hike = Hike.find(params[:id])
        if hike.user == current_user
            hike.destroy
            redirect_to hikes_path
        else 
            redirect_to root_path
        end
    end

    private

    def hike_params(*args)
        params.require(:hike).permit(*args)
      end
 
end
