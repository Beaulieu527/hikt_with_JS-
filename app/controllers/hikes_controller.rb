class HikesController < ApplicationController
    before_action :authenticate_user! 
 
    def index
        @hikes = Hike.search(params[:search])
    end

    def new
        @hike = Hike.new

    end
    
    def create
        if @hike = current_user.hikes.create(hike_params)
            redirect_to hikes_path
        else 
            render :new
        end
    end
    
    def show
        @hike = Hike.find(params[:id])
    end

    def edit
        @hike = Hike.find(params[:id])
    end

    def update
        @hike = Hike.find(params[:id])
        if @hike && @hike.user == current_user
            @hike.update(hike_params)
            redirect_to hikes_path
        else
            render :edit
        end
    end

    def destroy
        @hike = Hike.find(params[:id])
        if @hike && @hike.user == current_user
            @hike.destroy
            redirect_to hikes_path
        else 
            redirect_to @hike
        end
    end

    private

    def hike_params
        params.require(:hike).permit(:name, :summary, :location, :length,:img_url)
    end
 
end
