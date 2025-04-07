class BooksController < ApplicationController
  def index
    @books = Book.all

    render json: @books
  end

  def show
    @book = Book.find_by(id: params[:id])

    render json: @book
  end

  def reserve
    book = Book.find(params[:id])
    email = params[:email]

    book.reserve!(email)

    render json: { message: "Book reserved successfully." }, status: :created
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Book not found" }, status: :not_found
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def book_params
    params.permit(:email)
  end
end
