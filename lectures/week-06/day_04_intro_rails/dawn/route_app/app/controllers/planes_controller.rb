class PlanesController < ApplicationController

  # root route
  def index
    #render text: "Hello, pilots!"
    render :index
  end

  # method for handling new planes
  def new
    render :new
  end

  # a method to handle submitted planes
  def create
    redirect_to "/planes"
  end

end

