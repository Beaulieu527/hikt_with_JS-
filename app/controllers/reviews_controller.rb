class ReviewsController < ApplicationController
    before_action :authenticate_user!
 
    def index
        @reviews = current_website.reviews.all
    end

    def new
        @review = review.new

    end
    
    def create
        review = review.create(review_params)
        current_hike.reviews << review
        redirect_to reviews_path
    end
    
    def show
        @review = id(review)
    end

    def edit
        @review = id(review)
    end

    def update
        review = id(review)
        review.update(review_params)
        review.save
        redirect_to reviews_path
    end

    def destroy
        id(current_hike.reviews).destroy
        redirect_to reviews_path
    end

    private

    def review_params
        params.require(:review).permit(:content)
    end
end
