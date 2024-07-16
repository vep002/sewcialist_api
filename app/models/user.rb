class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self
  has_many :projects
  has_many :materials

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
  # validates :role, inclusion: { in: [0,1] } # 0=regular user, 1=admin
  validates :reset_password_token, uniqueness: true, allow_nil: true

  def password_required?
    new_record? || !password.nil?
  end
end
