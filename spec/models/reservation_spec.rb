require 'rails_helper'
require 'devise'

RSpec.describe Reservation, type: :model do
  before(:each) do
    user = User.create(email: 'user@example.com', password: 'password')
    house = House.create(name: 'one-floor', area: 100, rental_fee: 1000)
    @reservation = Reservation.create(user:, house:, location: 'yangon',
                                      reservation_date: '2021-07-19 15:04:28')
  end

  describe 'validations' do
    it 'should be vaild with valid attributes' do
      expect(@reservation).to be_valid
    end

    it 'should not be vaild without user' do
      @reservation.user = nil
      expect(@reservation).not_to be_valid
    end

    it 'should not be vaild without house' do
      @reservation.house = nil
      expect(@reservation).not_to be_valid
    end

    it 'should not be vaild without location' do
      @reservation.location = nil
      expect(@reservation).not_to be_valid
    end

    it 'should not be vaild without reservation date' do
      @reservation.reservation_date = nil
      expect(@reservation).not_to be_valid
    end
  end

  describe 'associations' do
    it 'should have belongs to house' do
      house_reservation = Reservation.reflect_on_association(:house)
      expect(house_reservation.macro).to eq(:belongs_to)
    end

    it 'should have belongs to user' do
      user_reservation = Reservation.reflect_on_association(:user)
      expect(user_reservation.macro).to eq(:belongs_to)
    end
  end
end
