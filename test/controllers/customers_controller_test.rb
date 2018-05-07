require "test_helper"

describe CustomersController do
  it "should get index" do
    get customers_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get customers_show_url
    value(response).must_be :success?
  end

  it "should get update" do
    get customers_update_url
    value(response).must_be :success?
  end

  it "should get create" do
    get customers_create_url
    value(response).must_be :success?
  end

  it "should get destroy" do
    get customers_destroy_url
    value(response).must_be :success?
  end

  it "should get new" do
    get customers_new_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get customers_edit_url
    value(response).must_be :success?
  end

end
