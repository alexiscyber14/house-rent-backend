require 'rails_helper'

RSpec.describe House, type: :model do
  before(:each) do
    # Create a User object for the association
    user = User.create(name: 'Alex', email: 'user@example.com', password: 'password', password_confirmation: 'password')

    @house = House.create(
      name: 'one-floor',
      location: '100',
      rental_fee: 1000,
      date_built: '2000-01-01',
      category: 'apartment',
      description: 'very nice',
      image_url: 'https://goodle.com/image.pn',
      user: # Set the user association here
    )
  end

  describe 'validations' do
    it 'should be valid with valid attributes' do
      expect(@house).to be_valid
    end

    it 'should not be valid without name' do
      @house.name = nil
      expect(@house).not_to be_valid
    end

    it 'should not be valid without rental fee' do
      @house.rental_fee = nil
      expect(@house).not_to be_valid
    end
  end

  describe 'associations' do
    it 'should have many reservations' do
      house_reservation = House.reflect_on_association(:reservations)
      expect(house_reservation.macro).to eq(:has_many)
    end
  end
end
