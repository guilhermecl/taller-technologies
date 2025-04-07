require "rails_helper"

RSpec.describe "Books request", type: :request do
  let!(:book) { Book.create!(name: "Test Book", status: :available) }

  context "POST /books/:id/reserve" do
    it "reserves a book" do
      post "/books/#{book.id}/reserve", params: { email: "teste@example.com" }

      expect(response).to have_http_status(:created)
    end

    it "returns error when a book is already reserved" do
      book.update!(status: :reserved)
      post "/books/#{book.id}/reserve", params: { email: "teste@example.com" }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "return 404 when the book doesn't exist" do
      post "/books/blabla/reserve", params: { email: "teste@example.com" }

      expect(response).to have_http_status(:not_found)
    end
  end
end
