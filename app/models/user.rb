class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :authenticatable

  has_one :user_database_authentication, dependent: :destroy
end
