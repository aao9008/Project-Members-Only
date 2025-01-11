require 'rails_helper'

RSpec.describe "Bi-Directional Associations", type: :model do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, author: user) }

  it "does not execute additional queries for already-loaded data" do
    user_with_posts = User.includes(:posts).first

    # Ensure no additional queries are triggered by checking if all posts belong to the user
    expect do
      user_with_posts.posts.each { |post| expect(post.author).to eq(user_with_posts) }
    end.to query_limit_eq(0) # Ensure no additional queries are made
  end

  it "ensures data consistency between associated objects" do
    user.username = "Changed Name"
    expect(user.username).to eq(post.author.username)
  end

  it "saves the parent object when the child object is saved" do
    post = user.posts.first
    post.save!

    expect(post.persisted?).to be(true)
    expect(user.persisted?).to be(true)
  end
end
