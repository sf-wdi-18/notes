class PlanesController < ApplicationController

  # root route
  def index
    # grab all planes
    @planes = Plane.all
    # render text: "Hello, pilots!"
    render :index
  end

  # method for handling new planes
  def new
    render :new
  end

  # a method to handle submitted planes
  def create
    plane = params.require(:plane).permit(:name, :design, :description)
    Plane.create(plane)
    redirect_to "/planes"
  end

  def show
    # grab the id from /planes/:id route
    plane_id = params[:id]
    # find the plane in the DB
    @plane = Plane.find(plane_id)

    # render that plane
    render :show
  end

end

