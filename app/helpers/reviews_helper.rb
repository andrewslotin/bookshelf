module ReviewsHelper
  def snippet(review, size = 400)
    "#{review.body[0...size]}…"
  end
end
