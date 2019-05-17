class AddOfferToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :offer, :text
    add_column :games, :response, :text
  end
end
