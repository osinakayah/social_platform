class CreateUserFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :user_friends do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :status, default: 0
      t.timestamps
    end
    add_index :user_friends, :user_id
    add_index :user_friends, :friend_id
    add_index :user_friends, [:user_id, :friend_id], unique: true
  end
end
