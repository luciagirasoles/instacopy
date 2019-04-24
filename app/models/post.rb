class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :media
  has_many :comments
end
