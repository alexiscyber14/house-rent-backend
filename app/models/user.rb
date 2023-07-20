class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :houses, dependent: :destroy
  has_many :reservations

  enum role: %i[user admin]

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :user
  end
end
