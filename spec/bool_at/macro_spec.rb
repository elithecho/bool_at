require "spec_helper"

RSpec.describe BoolAt::Macro do
  before do
    Post.bool_at :published_at
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

    context "#bool! method" do
      it "sets published_at when banging bool_at method" do
        post = Post.new
        expect { post.published! }.to change { post.published_at }.from(nil)
      end

      it "sets date now" do
        post = Post.new
        post.published!
        expect(post.published_at).to be_a(Time)
      end
    end
  end
end
