class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,  :omniauthable, omniauth_providers: [:facebook]

  validates_presence_of :first_name, :last_name, :phone_number, :birth_day, :gender
  validates_uniqueness_of :email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_format_of :email, with: VALID_EMAIL_REGEX


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.image_url = auth.info.image # assuming the user model has an image
      user.birth_day = auth.user_birthday
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def posts
    secondary_friends = "SELECT friend_id FROM user_friends WHERE  user_id = :user_id OR friend_id = :user_id"
    primary_friends = "SELECT user_id FROM user_friends WHERE  user_id = :user_id OR friend_id = :user_id"

    Post.where("user_id IN (#{secondary_friends}) OR user_id IN (#{primary_friends})", user_id: id)
  end

  has_many :posts, dependent: :destroy

end
