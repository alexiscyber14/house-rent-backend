require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  before(:each) do
    @user_one = User.create(name: 'User one', email: 'userone@example.com', password: 'password', role: 'admin')
    @user_two = User.create(name: 'User two', email: 'usertwo@example.com', password: 'password')

    sign_in @user_one
  end

  describe 'GET /index' do
    before(:each) do
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'get correct response status' do
      expect(@controller.action_name).to eq 'index'
    end

    it 'has a correct response body' do
      user = JSON.parse(response.body)

      assert_equal user.length, 2
    end
  end

  describe 'GET /show' do
    before(:each) do
      get :show
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'shows the correspondent member data' do
      user = JSON.parse(response.body)

      assert_equal user['user']['id'], @user_one.id
      assert_equal user['user']['name'], @user_one.name
      assert_equal user['user']['email'], @user_one.email
      assert_equal user['user']['role'], @user_one.role
    end
  end
end
