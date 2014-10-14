module Api::V1
  class ResourceCategoriesController < ApplicationController
    
    def index
      @resource_categories = ResourceCategory.all
      respond_to do |format|
        format.json
        format.xml { render xml: @resource_categories, status: 200}
      end
    end

    def show
      @categories = ResourceCategory.find(params[:id])
      @resources = @resoure_categories.resources
      respond_to do |format|
        format.json
        format.xml { render xml: @resources, status: 200}
      end
    end

  end
end