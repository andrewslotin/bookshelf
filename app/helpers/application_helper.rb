module ApplicationHelper
  def format_book_title(title)
    "«#{title}»"
  end

  def book_title_with_author(book)
    "#{book.author.name} #{format_book_title(book.title)}"
  end
end
