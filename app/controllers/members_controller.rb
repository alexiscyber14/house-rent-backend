class MembersController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.all
    if current_user.role == 'admin'
      render json: user
    else
      render json: { message: 'You are not authorized to view this page.' }
    end
  end

  def show
    user = current_user
    render json: {
      message: 'success',
      user:
    }
  end
end
