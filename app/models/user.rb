class User < ApplicationRecord
  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  presence: true, length: {maximum: Settings.name.maximum}
  validates :email, presence: true, length: {maximum: Settings.email.maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, length: {minimum: Settings.password.minimum}

  has_secure_password

  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost?
    BCrypt::Engine::MIN_COST :BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end

  private

  def downcase_email
    email.downcase!
  end
end
