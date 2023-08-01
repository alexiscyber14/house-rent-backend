require 'rails_helper'

RSpec.describe Api::V1::HousesController, type: :controller do
  include FactoryBot::Syntax::Methods
  include Devise::Test::ControllerHelpers
  describe 'GET #index' do
    it 'returns a list of houses' do
      house1 = FactoryBot.build(:house)
      allow(House).to receive(:all).and_return([house1])

      get :index
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(house1.name)
    end
  end

  describe 'GET #show' do
    it 'returns the details of a house' do
      user = User.create(name: 'Alex', email: 'user@example.com', password: 'password',
                         password_confirmation: 'password')
      @house = House.create(
        name: 'one-floor',
        location: '100',
        rental_fee: 1000,
        date_built: '2000-01-01',
        category: 'apartment',
        description: 'very nice',
        image_url: 'https://goodle.com/image.pn',
        user:
      )
      allow(House).to receive(:find).with(@house.id.to_s).and_return(@house)

      get :show, params: { id: @house.id }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(@house.name)
    end

    it 'returns not found for non-existing house' do
      allow(House).to receive(:find).and_raise(ActiveRecord::RecordNotFound)

      get :show, params: { id: 12_345 }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST #create' do
    context 'when user is authenticated' do
      let(:user) { FactoryBot.create(:user) }
      let(:house_params) { FactoryBot.attributes_for(:house) }

      before do
        sign_in user
      end

      it 'creates a new house' do
        new_house = instance_double(House, save: true)
        allow(user.houses).to receive(:build).and_return(new_house)
        post :create, params: { house: house_params }
        expect(response).to have_http_status(:created)
        expect(response.body).to include(house_params[:name])
      end

      it 'returns unprocessable entity for invalid house' do
        invalid_house_params = house_params.merge(name: nil)
        post :create, params: { house: invalid_house_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when user is not authenticated' do
      it 'returns unauthorized' do
        post :create, params: { house: FactoryBot.attributes_for(:house) }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
