require 'date'

class RentalsController < ApplicationController

  RENTAL_PERIOD = 7

  def check_in
    rental = Rental.find_by(movie_id:rental_params["movie_id"], customer_id: rental_params["customer_id"])
    movie = Movie.find_by(id: rental.movie_id)
    customer = Customer.find_by(id: rental_params[:custmer_id])
    if movie
      movie.update_checkin
      if customer
        customer.update_count("out")
      end
    end

    if rental.delete
      render json: { id: movie.id }, status: :ok
    else
      render json: {ok: false, errors: rental.errors}, status: :bad_request
    end
  end



  def check_out
    movie = Movie.find_by(id: rental_params[:movie_id])
    rental = Rental.new(rental_params)

    if movie
      if movie.available_inventory > 0
        movie.update_checkout

        rental.checkout_date = Date.today
        rental.due_date = rental.checkout_date + RENTAL_PERIOD
        rental.save

        customer = Customer.find_by(id: rental_params[:custmer_id])

        if customer
          customer.update_count("out")
        end

      else
        render json: {
          errors: ["No copies are currently available"]
        }, status: :ok
        return
      end

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
