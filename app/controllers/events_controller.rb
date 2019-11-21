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
    @events = Event.all
  end

  def show
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end
end
