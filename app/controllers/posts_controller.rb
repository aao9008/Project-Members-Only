class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:success] = "Great! Your post has been created!"
      redirect_to new_post_path
    else
      flash[:error] = "Rats, fix your mistakes please."
      render :new, status: :unprocessable_entity
    end
  end

  protected

  def post_params
    params.expect(post: [ :title, :body ])
  end
end
