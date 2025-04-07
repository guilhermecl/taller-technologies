class BookReservation < ApplicationRecord
  belongs_to :book

  validates :book, uniqueness: true
end
