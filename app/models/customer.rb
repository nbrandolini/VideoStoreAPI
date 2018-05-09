class Customer < ApplicationRecord
  has_many :rentals
  
  validates :name, presence: :true, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
    message: "Only allows letters" }
end
