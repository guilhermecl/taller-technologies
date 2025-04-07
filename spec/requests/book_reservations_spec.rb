require 'rails_helper'

RSpec.describe "BookReservations", type: :request do
  describe "GET /:reserve" do
    it "returns http success" do
      get "/book_reservations/:reserve"
      expect(response).to have_http_status(:success)
    end
  end

end
