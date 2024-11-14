class AddDeviseFieldsToAdminUser < ActiveRecord::Migration[6.1]
  def change
    change_table :admin_users, bulk: true do |t|
      # Remove any duplicate fields causing conflicts
      t.string :confirmation_token # Only if it's not already present
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
    end
  end
end
