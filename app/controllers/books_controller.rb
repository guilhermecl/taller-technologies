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
    book_reservation = BookReservation.new(book_id: params[:id], email: params[:email])

    book_reservation.save

    render json: book_reservation, status: :created if book_reservation.valid

    render json: book_reservation.erros.full_messages, status: :unprocessable_identity
  end

  private

  def book_params
    params.permit(:email)
  end
end
