class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    # intanstiate for new.html.erb form to use
    @restaurant = Restaurant.new
  end

  def create
    # takes info from new form (rest_params) to create
    @restaurant = Restaurant.new(rest_params)
    # check if save is true
    # save
    if @restaurant.save
      #redirect to specific page of this restautant
      redirect_to restaurant_path(@restaurant)
    else
    # render means to call a view with the name :new
      render :new
    end
  end

  def show
    # find the restaurant associated with id
    @restaurant = Restaurant.find(params[:id])
    # send to show.html
  end

  private

  def rest_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
