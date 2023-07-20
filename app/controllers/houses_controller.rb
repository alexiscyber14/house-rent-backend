class HousesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_house, only: %i[show edit update destroy]
  respond_to :json

  # GET /houses
  def index
    @houses = House.all
  end

  # GET /houses/1
  def show; end

  # GET /houses/new
  def new
    @house = current_user.houses.build
  end

  # GET /houses/1/edit
  def edit
    # Ensure the current user owns the house before allowing editing
    return if current_user == @house.user

    redirect_to @house, alert: 'You are not authorized to edit this house.'
  end

  # POST /houses
  def create
    @house = current_user.houses.build(house_params)

    if @house.save
      redirect_to @house, notice: 'House was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /houses/1
  def update
    # Ensure the current user owns the house before allowing updating
    unless current_user == @house.user
      redirect_to @house, alert: 'You are not authorized to update this house.'
      return
    end

    if @house.update(house_params)
      redirect_to @house, notice: 'House was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /houses/1
  def destroy
    # Ensure the current user owns the house before allowing deletion
    unless current_user == @house.user
      redirect_to @house, alert: 'You are not authorized to delete this house.'
      return
    end

    @house.destroy
    redirect_to houses_url, notice: 'House was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_house
    @house = House.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def house_params
    params.require(:house).permit(:name, :rental_fee, :date_built, :category, :description, :image_url)
  end
end
