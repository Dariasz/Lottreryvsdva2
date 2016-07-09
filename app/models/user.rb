class User < ApplicationRecord


has_and_belongs_to_many :item, :join_table => :users_items

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    mount_uploader :avatar, AvatarUploader

end
