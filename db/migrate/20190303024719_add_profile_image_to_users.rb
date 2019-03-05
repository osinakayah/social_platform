class AddProfileImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_url, :string, null: false, default: "http://icons.iconarchive.com/icons/hopstarter/superhero-avatar/256/Avengers-Thor-icon.png"
  end
end
