require 'rails_helper'
require 'devise'

RSpec.describe User, type: :model do
  config.include Devise::Test::ControllerHelpers, type: :controller
  before(:each) do
    @user = User.create(email: 'user@example.com', password: 'password')
  end

  describe 'validations' do
    it 'should be vaild with valid attributes' do
      expect(@user).to be_valid
    end

    it 'should not be valid without email' do
      @user.email = nil
      expect(@user).not_to be_valid
    end
  end

  describe 'associations' do
    it 'should have many reservations' do
      user_categories = User.reflect_on_association(:reservations)
      expect(user_categories.macro).to eq(:has_many)
    end
  end
end
