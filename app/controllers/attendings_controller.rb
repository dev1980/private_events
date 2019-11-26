# frozen_string_literal: true

class AttendingsController < ApplicationController
  before_action :only_logged_in_users
  before_action :only_new_attendees

  def create
    attendee = User.find(params[:user_id])
    event = Event.find(params[:event_id])

    if attendee && event
      attendee.attendings.create(event_id: event.id)
      redirect_to event
    else
      render html: 'error'
    end
  end

  private

  def only_new_attendees
    attendee = User.find(params[:user_id])
    event = Event.find(params[:event_id])

    redirect_to event if event.attendees.include? attendee
  end
end
