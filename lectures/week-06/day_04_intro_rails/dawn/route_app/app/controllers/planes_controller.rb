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
    @plane = Plane.create(plane)

    # send users to show page using 
    # new plane id
    redirect_to "/planes/#{@plane.id}"
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

