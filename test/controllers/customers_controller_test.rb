require "test_helper"

describe CustomersController do

  describe "index" do
    it "is a real working route" do
      get customers_path
      must_respond_with :success
    end

    it "returns json" do
      get customers_path
      response.header['Content-Type'].must_include 'json'
    end

    it "returns an Array" do
      get customers_path
      body = JSON.parse(response.body)
      body.must_be_instance_of Array
    end

    it "returns all of the customers" do
      get customers_path
      body = JSON.parse(response.body)
      body.length.must_equal Customer.count
    end

    it "returns customers with exactly the fields required" do
      keys = %w(name registered_at postal_code phone address city state)
      get customers_path
      body = JSON.parse(response.body)
      body.each do |customer|
        customer.keys.sort.must_equal keys.sort
      end
    end
  end

  # it "should get show" do
  #   get customers_show_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get update" do
  #   get customers_update_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get create" do
  #   get customers_create_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get destroy" do
  #   get customers_destroy_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get new" do
  #   get customers_new_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get edit" do
  #   get customers_edit_url
  #   value(response).must_be :success?
  # end
end
