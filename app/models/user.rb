class User < ApplicationRecord
  has_secure_password

  has_many :user_games, dependent: :destroy
  has_many :games, through: :user_games

  before_validation :normalize_email

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {
    with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  }

  def self.from_token_request request
    email = request.params["auth"] && request.params["auth"]["email"]
    email = self.email_to_lowecase(email)
    self.find_by email: email
  end

  def to_hash
    { name: try(:name) || 'No Name', email: email }
  end

  def valid_token?(token)
    reset_pass_token && reset_pass_token == token
  end

  protected

  def normalize_email
    email_array = self.email.split('@')
    self.email = self.class.email_to_lowecase(email)
  end

  def self.email_to_lowecase(email)
    email_array = email.split('@')
    [email_array[0], email_array[1].try(:downcase)].join('@')
  end
end
