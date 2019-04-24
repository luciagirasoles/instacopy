class User < ApplicationRecord
  has_many :followed_relations, class_name: 'Follow',
                                foreign_key: 'follower_id',
                                dependent: :destroy
  has_many :follower_relations, class_name: 'Follow',
                                foreign_key: 'followed_id',
                                dependent: :destroy
  has_many :following, through: :followed_relations, source: :followed
  has_many :followers, through: :follower_relations, source: :follower
  has_many :posts

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def like(post)
    post.likes.create(user: self)
  end

  def publish(description, *media)
    post = posts.create(description: description)
    media.each do |medium|
      post.media << medium
    end
    post
  end

  def comment(body, post)
    post.comments.create(user: self, body: body)
  end
end
