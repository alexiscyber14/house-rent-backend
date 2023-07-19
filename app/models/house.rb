class House < ApplicationRecord
    has_many :reservations
    validates :name, presence: true
    validates :rental_fee, presence: true
end
