require 'date'

class RentalsController < ApplicationController

  RENTAL_PERIOD = 7

  def check_in
  end

  def check_out
    rental = Rental.create(rental_params)
    rental.checkout_date = Date.today
    rental.due_date = rental.checkout_date + RENTAL_PERIOD
    rental.save

    movie = Movie.find_by(id: rental.movie_id)
    
    if movie
      movie.update_available
    end

    if rental.valid?
      render json: {due_date: rental.due_date}, status: :ok
    else
      render json: {ok: false, errors: rental.errors}, status: :bad_request
    end

  end

  private

  def rental_params
    params.permit(:customer_id, :movie_id)
  end
end
