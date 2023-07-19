require 'rails_helper'
require 'devise'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(email: 'user@example.com', password: 'password')
  end

  describe 'validations' do
    it 'should be vaild with valid attributes' do
      expect(@user).to be_valid
    end
  end

  describe 'associations' do
    it 'should have many reservations' do
      user_reservations = User.reflect_on_association(:reservations)
      expect(user_reservations.macro).to eq(:has_many)
    end
  end
end
