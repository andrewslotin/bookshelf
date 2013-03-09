class BooksController < ApplicationController
  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_params)

    redirect_to :back
  end

  private

  def book_params
    params.require(:book).permit(:cover, :remove_cover)
  end
end
