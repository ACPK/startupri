module Api::V1
  class ResourcesController < ApplicationController
    
    def index
      @resources = Resource.all.order("name")
      respond_to do |format|
        format.json
        format.xml { render xml: @resources, status: 200}
      end
    end

  end
end