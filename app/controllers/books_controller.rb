# frozen_string_literal: true

# initializing books controler

# :nodoc:
class BooksController < OpenReadController
  def index
    @books = Book.all

    render json: @books
  end

  def show
    @book = Book.find(params[:id])

    render json: @book
  end
end
