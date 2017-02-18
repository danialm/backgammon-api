class Game < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_many :user_games, dependent: :destroy
  has_many :users, through: :user_games

  validates :name, presence: true
  validates :user_games, presence: true

  def users_hash
    users.map do |u|
      user = u.to_hash
      user[:accepted] = user_games.detect { |ug| ug.user_id == u.id }.accepted
      user
    end
  end

  def to_hash
    {
      name: name,
      id: id,
      url: game_url(id),
      users: users_hash
    }
  end
end
