class ReviewsController < ApplicationController
    def index
        @events = current_website.events.all
    end

    def new
        @event = Event.new
        @invitations = current_website.invitations
    end
    
    def create
        event = Event.create(event_params)
        current_website.events << event
        redirect_to events_path
    end
    
    def show
        @event = id(Event)
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
