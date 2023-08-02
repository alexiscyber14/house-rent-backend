require 'rails_helper'
require 'devise'

RSpec.describe Reservation, type: :model do
  before(:each) do
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
    @reservation = Reservation.create(
      user:,
      house: @house,
      city: 'yangon',
      reservation_date: '2021-07-19 15:04:28'
    )
  end

  describe 'validations' do
    it 'should be valid with valid attributes' do
      expect(@reservation).to be_valid
    end

    it 'should not be valid without user' do
      @reservation.user = nil
      expect(@reservation).not_to be_valid
    end

    it 'should not be valid without house' do
      @reservation.house = nil
      expect(@reservation).not_to be_valid
    end

    it 'should not be valid without location' do
      @reservation.city = nil
      expect(@reservation).not_to be_valid
    end

    it 'should not be valid without reservation date' do
      @reservation.reservation_date = nil
      expect(@reservation).not_to be_valid
    end
  end

  describe 'associations' do
    it 'should belong to house' do
      house_reservation = Reservation.reflect_on_association(:house)
      expect(house_reservation.macro).to eq(:belongs_to)
    end

    it 'should belong to user' do
      user_reservation = Reservation.reflect_on_association(:user)
      expect(user_reservation.macro).to eq(:belongs_to)
    end
  end
end
