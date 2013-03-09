class Book < ActiveRecord::Base
  belongs_to :author
  has_many :reviews, dependent: :destroy

  attr_accessor :author_name

  validates :author_id, presence: true
  validates :title, presence: true, uniqueness: { scope: :author }

  before_validation :assign_author

  mount_uploader :cover, CoverUploader

  def to_s
    title
  end

  def rating
    reviews.sum(:rating) / reviews.count.to_f
  end

  private

  def assign_author
    self.author = Author.find_or_create_by_name(author_name) if @author_name.present?
  end
end
