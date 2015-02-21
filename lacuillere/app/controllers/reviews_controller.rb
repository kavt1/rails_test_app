class ReviewsController < ApplicationController

  # GET /reviews/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    # @review = Review.new
    # @review.restaurant = @restaurant
    @review = @restaurant.reviews.new

  end

  # POST /restaurants
  def create
    @review = Review.new(reviews_params)
    if @review.save
      @restaurant = Restaurant.find(params[:restaurant_id])
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end
end
