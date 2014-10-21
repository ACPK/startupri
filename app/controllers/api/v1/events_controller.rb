module Api::V1
  class EventsController < ApplicationController
    
    def index
      @events = Event.where('hidden = false').where('start_time >= ?', Date.today).order(:start_time)
      respond_to do |format|
        format.json
        format.xml { render xml: @events, status: 200}
      end
    end

  end
end