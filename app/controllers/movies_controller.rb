class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render :json => movies.as_json(only: [:id, :title, :release_date, :overview, :inventory]), status: :ok
  end

  def show
    movie = Movie.find_by(id: params[:id])

    if movie
      show_movie_hash = {
        title: movie.title,
        overview: movie.overview,
        release_date: movie.release_date,
        inventory: movie.inventory
      }
      render json: show_movie_hash.as_json, status: :ok
    else
      render json: { ok: false }, status: :not_found
    end
  end



  # def update
  # end

  def create
    movie = Movie.create(movie_params)

    if movie.valid?
      render json: {id: movie.id}, status: :ok
    else
      render json: {ok: false, errors: movie.errors}, status: :bad_request
    end
  end

  # def destroy
  # end


  private

  def movie_params
    params.permit(:title, :overview, :release_date, :inventory)
  end

end
