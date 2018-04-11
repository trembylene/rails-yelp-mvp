class ReviewsController < ApplicationController
before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = review.all
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show'
    end
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def show
  end

  protected

  def update
    @review.update(review_params)

    redirect_to restaurant_path(@restaurant)
  end


  def destroy
    @review.destroy

    redirect_to restaurants_path
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
