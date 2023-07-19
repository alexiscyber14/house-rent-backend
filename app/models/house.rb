class House < ApplicationRecord
    validates :name, presence: true
    validates :rental_fee, presence: true
end
