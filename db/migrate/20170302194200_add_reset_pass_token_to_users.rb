class AddResetPassTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :reset_pass_token, :string
  end
end
