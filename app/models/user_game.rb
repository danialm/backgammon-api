class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def users(current_user)
    game.users.select { |u| u.to_hash unless u.email == current_user.email }
  end
end
