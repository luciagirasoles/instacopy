class ReportsController < ApplicationController
  def index
  end

  def top_user_posts
    @users = User.joins(:posts).group('users.id').order('count(posts.id) DESC')
  end

  def top_user_likes
    @users = User.joins(posts: :likes).group('users.id').order('count(likes.id) DESC')
  end

  def top_posts
    @posts = Post.joins(:likes).group('posts.id').order('count(likes.id) DESC')
  end
end
