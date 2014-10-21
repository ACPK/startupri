module Api::V1
  class StartupsController < ApplicationController
    
    def index
      @startups = Startup.where('hidden = false').order("name")
      respond_to do |format|
        format.json
        format.xml { render xml: @startups, status: 200}
      end
    end

    def show
      @startup = Startup.find(params[:id])
      respond_to do |format|
        format.json
        format.xml { render xml: @startup, status: 200}
      end
    end

  end
end