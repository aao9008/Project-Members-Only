require "rails_helper"

RSpec.describe Post, type: :model do
  it { should belong_to(:author).class_name("User") }

  it "is invalid without an author" do
    post = Post.new(title: "test", body: "test details")
    expect(post).not_to be_valid
    expect(post.errors.full_messages).to include("Author must exist")
  end

  it "is valid when associated with an author" do
    user = User.new
    post = user.posts.new(title: "test", body: "test details")
    expect(post).to be_valid
  end
end
