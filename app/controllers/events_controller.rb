class EventsController < ApplicationController
  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to events_path
    else
      render html: "Error"
    end
  end

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def show
    @event = Event.includes(:attendees).find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end
end
