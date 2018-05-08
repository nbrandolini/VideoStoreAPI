require "test_helper"

describe MoviesController do
  describe "index" do
    it "is a real working route" do
      get movies_path
      must_respond_with :success
    end

    it "returns json" do
      get movies_path
      response.header['Content-Type'].must_include 'json'
    end

    it "returns an Array" do
      get movies_path
      body = JSON.parse(response.body)
      body.must_be_instance_of Array
    end

    it "returns all of the movies" do
      get movies_path
      body = JSON.parse(response.body)
      body.length.must_equal Movie.count
    end

    it "returns movies with exactly the fields required" do
      keys = %w(id title release_date)
      get movies_path
      body = JSON.parse(response.body)
      body.each do |movie|
        movie.keys.sort.must_equal keys.sort
      end
    end
  end


  # it "should get show" do
  #   get movies_show_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get update" do
  #   get movies_update_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get create" do
  #   get movies_create_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get destroy" do
  #   get movies_destroy_url
  #   value(response).must_be :success?
  # end

end
