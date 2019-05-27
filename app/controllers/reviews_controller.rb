class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_hike
    def index
        @reviews = set_hike.reviews.all
    end

    def new
        @review = set_hike.reviews.build

    end
    
    def create
        if current_user
            @review = set_hike.reviews.create(review_params)
            @review.user = current_user
            @review.save
        redirect_to hike_path(@hike)
        else
            render :new
        end
    end
    
    def show
        @review = set_hike.reviews.find(params[:id])
    end

    def edit
        @review = set_hike.reviews.find(params[:id])
    end

    def update
        @review = current_user.reviews.find(params[:id])
        @review.update(review_params)
        @review.save
        redirect_to hike_path(@hike)
    end

    def destroy
        current_user.review.destroy
        redirect_to reviews_path
    end

    private

    def review_params
        params.require(:review).permit(:content)
    end

end
