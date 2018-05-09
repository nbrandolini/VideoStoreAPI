require "test_helper"

describe RentalsController do
  it "should get check_in" do
    get rentals_check_in_url
    value(response).must_be :success?
  end

  it "should get check_out" do
    get rentals_check_out_url
    value(response).must_be :success?
  end

  describe "check out" do

      let(:rental_data) {
        { customer_id: 1,
          movie_id: 1,
          checkout_date: Date.today,
          due_date: Date.today + 7
        }
      }

    it "doesn't create rental without customer_id" do
      rental_data.delete(:customer_id)

      proc {
        post check_out_path, params: rental_data
      }.must_change 'Rental.count', 0

      must_respond_with :bad_request
      body = JSON.parse(response.body)
      body.must_be_kind_of Hash
      body.must_include "errors"
      body["errors"].must_include "customer_id"
    end

    it "doesn't create rental without movie_id" do
      rental_data.delete(:movie_id)

      proc {
        post check_out_path, params: rental_data
      }.must_change 'Rental.count', 0

      must_respond_with :bad_request
      body = JSON.parse(response.body)
      body.must_be_kind_of Hash
      body.must_include "errors"
      body["errors"].must_include "movie_id"
    end

    it "doesn't create rental if available inventory is zero" do
      movie = Movie.find_by(id: rental_data[:movie_id])
      movie.available_inventory = 0
      movie.save

      proc {
        post check_out_path, params: rental_data
      }.must_change 'Rental.count', 0

      must_respond_with :bad_request
      body = JSON.parse(response.body)
      body.must_be_kind_of Hash
      body.must_include "errors"
      body["errors"].must_include "None available"
    end

    it "doesn't create rental if movie doesn't exist" do
      movie = Movie.find_by(id: "abc")
      rental_data[:movie_id] = movie.id

      proc {
        post check_out_path, params: rental_data
      }.must_change 'Rental.count', 0

      must_respond_with :bad_request
      body = JSON.parse(response.body)
      body.must_be_kind_of Hash
      body.must_include "errors"
      body["errors"].must_include "None available"
    end
  end
end