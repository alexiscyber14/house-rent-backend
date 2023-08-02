# app/controllers/api/v1/reservations_controller.rb
module Api
  module V1
    class ReservationsController < ApplicationController
      before_action :authenticate_user!, only: %i[index create destroy]
      # before_action :set_house, only: %i[show edit update destroy]
      respond_to :json

      # GET /api/v1/reservations
      def index
        @reservations = current_user.reservations.includes(:house).where(house_id: params[:house_id])
        render json: @reservations
      end

      def index_user_reservations
        @reservations = current_user.reservations
        render json: @reservations
      end

      # GET /api/v1/reservations/1
      def show
        @reservation = current_user.reservations.includes(:house).where(house_id: params[:house_id]).find(params[:id])
        render json: @reservation
      end

      # POST /api/v1/houses/:house_id/reservations
      def create
        @house = House.find(params[:house_id])
        @reservation = @house.reservations.build(reservation_params)
        @reservation.user = current_user

        if @reservation.save
          render json: @reservation, status: :created
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/reservations/1
      def destroy
        @reservation = current_user.reservations.find(params[:id])
        @reservation.destroy
        render_json_response('Reservation was successfully canceled.')
      end

      private

      def reservation_params
        params.require(:reservation).permit(:reservation_date, :city)
      end

      def render_json_response(message, status = :ok)
        render json: { message: }, status:
      end
    end
  end
end
