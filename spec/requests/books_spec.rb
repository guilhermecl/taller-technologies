equire "rails_helper"

RSpec.describe "Books request", type: :request do
  book = Book.create(name: "Book 1")
  reserved_book = Book.create(name: "Book 2")

  context "POST /books/:id/reserve" do
    it "reserves a book" do
      post "/books/#{book.id}/reserve"

      expect(response).to have_http_status(:created)
    end

    it "returns error when a book is already reserved" do
      post "/books/#{reserved_book.id}/reserve"

      expect(response).to have_http_status(:unprocessable_identity)
    end
  end
end
