class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :house

  validates :city, presence: true
  validates :reservation_date, presence: true
end
