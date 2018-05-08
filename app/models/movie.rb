class Movie < ApplicationRecord
  validates :title, presence: true
  validates :release_date, presence: true
  validates :inventory, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
