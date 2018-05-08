class Customer < ApplicationRecord
  validates :name, presence: :true, format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/,
    message: "Only allows letters" }
end
