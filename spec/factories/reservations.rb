FactoryBot.define do
  factory :reservation do
    reservation_date { Date.today }
    city { 'New York' }
    house
    user
  end
end
