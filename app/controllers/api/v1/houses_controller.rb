# app/controllers/api/v1/houses_controller.rb
module Api
  module V1
    class HousesController < ApplicationController
      before_action :authenticate_user!, only: %i[create destroy]
      before_action :set_house, only: %i[show edit update destroy]
      before_action :find_user, only: %i[create update destroy]
      respond_to :json

      # GET /api/v1/houses
      def index
        @houses = House.all
        render json: @houses
      end

      # GET /api/v1/houses/1
      def show
        render json: @house
      end

      # POST /api/v1/houses
      def create
        unless @user.role == 'admin'
          render_json_response('You are not authorized to update this house.', :unauthorized)
          return
        end

        @house = @user.houses.build(house_params)

        if @house.save
          render json: @house, status: :created
        else
          render json: @house.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/houses/1
      def update
        unless @user == @house.user || @user.role == 'admin'
          render_json_response('You are not authorized to update this house.', :unauthorized)
          return
        end

        if @house.update(house_params)
          render json: @house
        else
          render json: @house.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/houses/1
      def destroy
        unless @user.role == 'admin'
          render_json_response('You are not authorized to delete this house.', :unauthorized)
          return
        end

        @house.destroy
        render_json_response('House was successfully deleted.', :ok)
      end

      private

      def set_house
        @house = House.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render_json_response('House not found.', :not_found)
      end

      def house_params
        params.require(:house).permit(:name, :location, :rental_fee, :date_built, :category, :description, :image_url)
      end

      def render_json_response(message, status = :ok)
        render json: { message: }, status:
      end

      def find_user
        @user = User.find(params[:user_id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
      end
    end
  end
end
