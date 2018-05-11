class AddingDefaultRentalDates < ActiveRecord::Migration[5.1]
  def change
    change_column :rentals, :checkout_date, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
