class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Establish bi-directional association with Post model
  has_many :posts, inverse_of: "author", foreign_key: "author_id"
end
