class User < ApplicationRecord
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist
  enum role: [ :donor, :recipient, :admin ]
end
