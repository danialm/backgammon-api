class CreateUserGames < ActiveRecord::Migration[5.0]
  def change
    create_table :user_games do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.boolean :accepted, default: false
      t.timestamps
    end
  end
end
