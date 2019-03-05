class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content, null: false
      t.string :image_url, null: false, default: 'https://www.desktopbackground.org/p/2012/04/15/374934_dark-website-backgrounds-wallpapers-walldevil-best-free-hd_1920x1200_h.jpg'
      t.integer :likes, null: false, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
  end
end
