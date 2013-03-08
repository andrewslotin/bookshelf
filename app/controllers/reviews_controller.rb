class ReviewsController < ApplicationController
  helper_method :review, :reviews

  def index
    
  end

  def show
    
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)

    respond_to do |format|
      if @review.errors.any?
        format.html { render :new }
      else
        format.html { redirect_to action: :index }
      end
    end
  end

  def edit
    
  end

  def update
  end

  def destroy
    review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :author_name, :book_title)
  end

  def review
    @review ||= Review.find(params[:id])
  end

  def reviews
    @reviews = Review.all
  end
end
