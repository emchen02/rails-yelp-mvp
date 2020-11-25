class ReviewsController < ApplicationController
  def new
    # find the rest id
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
    # go to html form
  end

  def create
    # takes info of restauarant and new review from new_html(review_params) to create
    @review = Review.new(reviews_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    # new_review does not know which rest it is giving to
    # assigning the restaurant's id to the review
    @review.restaurant = @restaurant
    # to save the review with that id to the database if valid
    if @review.save
    # redirect to show the rest 'restaurants/:id' and pass in @rest so it gets the id
      redirect_to restaurant_path(@restaurant)
    else
      # render means to call a view with the name :new
      render :new
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:rating, :content)
  end
end
