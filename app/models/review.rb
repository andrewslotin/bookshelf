class Review < ActiveRecord::Base
  belongs_to :book

  attr_accessor :author_name, :book_title

  validates :book_id, presence: true
  validates :rating, presence: true, numericality: { in: 1..5 }

  scope :comments, -> { where("COALESCE(body, '') != ''") }

  before_validation :assign_book

  def author_name
    @author_name || book.author.name
  end

  def book_title
    @book_title || book.title
  end

  private

  def assign_book
    self.book = if @book_title.present?
      Book.find_or_create_by_title(book_title) do |book|
        book.author_name = self.author_name
      end
    end
  end
end
