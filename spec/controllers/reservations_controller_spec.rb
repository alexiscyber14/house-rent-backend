require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
  include Devise::Test::ControllerHelpers
  include FactoryBot::Syntax::Methods
  describe 'GET #index' do
    context 'when user is authenticated' do
      let(:user) { FactoryBot.create(:user) }
      let(:house) { FactoryBot.create(:house) }

      before do
        sign_in user
      end

      it 'returns a list of reservations for the current user' do
        reservation1 = FactoryBot.create(:reservation, user:, house:)
        reservation2 = FactoryBot.create(:reservation, user:, house:)

        get :index, params: { house_id: house.id }
        expect(response).to have_http_status(:ok)

        reservations = JSON.parse(response.body)
        expect(reservations.length).to eq(2)
        expect(reservations[0]['id']).to eq(reservation1.id)
        expect(reservations[1]['id']).to eq(reservation2.id)
      end
    end

    context 'when user is not authenticated' do
      it 'returns unauthorized' do
        house = FactoryBot.create(:house)

        get :index, params: { house_id: house.id }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'POST #create' do
    context 'when user is authenticated' do
      let(:user) { FactoryBot.create(:user) }
      let(:house) { FactoryBot.create(:house) }
      let(:reservation_params) { FactoryBot.attributes_for(:reservation) }

      before do
        sign_in user
      end

      it 'creates a new reservation for the house' do
        post :create, params: { house_id: house.id, reservation: reservation_params }

        expect(response).to have_http_status(:created)
        expect(response.body).to include(reservation_params[:city])
      end

      it 'returns unprocessable entity for invalid reservation' do
        invalid_reservation_params = reservation_params.merge(city: nil)

        post :create, params: { house_id: house.id, reservation: invalid_reservation_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when user is not authenticated' do
      it 'returns unauthorized' do
        house = FactoryBot.create(:house)
        post :create, params: { house_id: house.id, reservation: FactoryBot.attributes_for(:reservation) }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user is authenticated' do
      let(:user) { FactoryBot.create(:user) }
      let(:house) { FactoryBot.create(:house) }

      before do
        sign_in user
      end

      it 'destroys the reservation belonging to the current user' do
        reservation = FactoryBot.create(:reservation, user:, house:)

        delete :destroy, params: { house_id: house.id, id: reservation.id }

        expect(response).to have_http_status(:ok)
        expect(Reservation.find_by_id(reservation.id)).to be_nil
      end
    end

    context 'when user is not authenticated' do
      it 'returns unauthorized' do
        reservation = FactoryBot.create(:reservation)
        delete :destroy, params: { house_id: reservation.house.id, id: reservation.id }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
