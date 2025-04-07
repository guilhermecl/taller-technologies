class Book < ApplicationRecord
  enum :status, { available: 0, reserved: 1, checked_out: 2 }

  has_many :book_reservations

  def reserve!(user_email)
    raise StandardError, "Book is not available" unless available?

    transaction do
      book_reservations.create!(email: user_email)
      update!(status: :reserved)
    end
  end
end
