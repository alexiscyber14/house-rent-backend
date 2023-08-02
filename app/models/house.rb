class House < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates :name, presence: true
  validates :rental_fee, presence: true
end
