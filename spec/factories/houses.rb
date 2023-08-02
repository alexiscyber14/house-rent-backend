FactoryBot.define do
  factory :house do
    name { 'House 1' }
    location { '100' }
    rental_fee { 1000 }
    date_built { '2000-01-01' }
    category { 'apartment' }
    description { 'very nice' }
    image_url { 'https://goodle.com/image.pn' }
    user # Create an association with the user factory
  end
end
