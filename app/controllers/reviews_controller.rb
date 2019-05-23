class ReviewsController < ApplicationController
    def index
        
    end

    def new
        
    end
    
    def create
        
    end
    
    def show
      
    end

    def edit
      
    end

    def update
       
    end

    def destroy
       
    end

    private

    def review_params
        params.require(:review).permit(:title, :description, :date, :location, :attire)
    end
end
