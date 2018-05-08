class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render :json => movies.as_json(only: [:id, :title, :release_date, :overview, :inventory]), status: :ok
  end

  def show
  end

  def update
  end

  def create
  end

  def destroy
  end
end
