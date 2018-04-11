class Review < ApplicationRecord
  RATINGS = [0, 1, 2, 3, 4, 5]

  belongs_to :restaurant

  validates_associated :restaurant
  validates :content, presence: :true
  validates :rating, presence: :true, inclusion: {in: RATINGS,
    message: "%{value} is not a valid rating"},
    numericality: { only_integer: true }
end
