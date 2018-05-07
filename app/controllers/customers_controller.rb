class CustomersController < ApplicationController
  def index
    customers = Customer.all
    render :json => customers.as_json(only: [:name, :registered_at, :address, :city, :state, :postal_code, :phone]), status: :ok
  end

  def show
  end

  def update
  end

  def create
  end

  def destroy
  end

  def new
  end

  def edit
  end
end
