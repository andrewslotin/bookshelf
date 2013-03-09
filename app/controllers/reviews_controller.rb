class ReviewsController < ApplicationController
  helper_method :review, :reviews

  def index
    
  end

  def show
    
  end

  def new
    @review = Review.new(author_name: "", book_title: "")
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
    review.update_attributes(review_params)

    respond_to do |format|
      if @review.errors.any?
        format.html { render :edit }
      else
        format.html { redirect_to action: :show }
      end
    end
  end

  def destroy
    review.destroy
  end

  def feed
    @reviews = reviews.comments.order("created_at DESC")
    @updated = reviews.first.updated_at unless reviews.empty?

    respond_to do |format|
      format.atom { render layout: false }
      format.rss { redirect_to feed_path(format: :atom), status: :moved_permanently }
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :author_name, :book_title)
  end

  def review
    @review ||= Review.find(params[:id])
  end

  def reviews
    @reviews ||= Review.all
  end
end
