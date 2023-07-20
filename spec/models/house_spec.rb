require 'rails_helper'

RSpec.describe House, type: :model do
  before(:each) do
    @house = House.create(name: 'one-floor', area: 100, rental_fee: 1000)
  end

  describe 'validations' do
    it 'should be vaild with valid attributes' do
      expect(@house).to be_valid
    end

    it 'should not be vaild without name' do
      @house.name = nil
      expect(@house).not_to be_valid
    end

    it 'should not be vaild without rental fee' do
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
