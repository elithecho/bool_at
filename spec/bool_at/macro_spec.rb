require "spec_helper"

RSpec.describe BoolAt::Macro do
  before do
    Post.bool_at :published
  end

  describe "#bool_at" do
    it "defines bool_at to Model" do
      post = Post.new
      expect(post.published?).to be false
    end

    describe "#bool?" do
      it "is false when boo_at nil" do
        post = Post.new(published_at: nil)
        expect(post.published?).to be false
      end

      it "is true when date_time is defined in key_attribute" do
        post = Post.new(published_at: Time.now)
        expect(post.published?).to be true
      end
    end

    describe "setter" do
      it "sets time on current value" do
        post = Post.new
        post.published = true
        expect(post.published?).to be true
        expect(post.published_at).to be_a(Time)
      end

      it "removes value if nil" do
        post = Post.new(published_at: Time.current)
        post.published = false
        expect(post.published?).to be false
      end
    end
  end
end
