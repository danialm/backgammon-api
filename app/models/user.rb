class User < ApplicationRecord
  has_secure_password

  has_many :user_games, dependent: :destroy
  has_many :games, through: :user_games

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {
    with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  }

  def to_hash
    {
      name: try(:name) || 'No Name',
      email: email
    }
  end
end
