class Post < ApplicationRecord
  validates :title, :body, :author_id, presence: true

  belongs_to :author, class_name: "User"
end
