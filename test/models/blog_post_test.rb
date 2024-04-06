require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blog post" do
    assert build(:blog_post).draft?
  end

  test "draft? returns false for published blog post" do
    refute build(:blog_post, :published).draft?
  end

  test "draft? returns false for scheduled blog post" do
    refute build(:blog_post, :scheduled).draft?
  end

  test "published? returns false for draft blog post" do
    refute build(:blog_post).published?
  end

  test "published? returns true for published blog post" do
    assert build(:blog_post, :published).published?
  end

  test "published? returns false for scheduled blog post" do
    refute build(:blog_post, :scheduled).published?
  end

  test "scheduled? returns false for draft blog post" do
    refute build(:blog_post).scheduled?
  end

  test "scheduled? returns false for published blog post" do
    refute build(:blog_post, :published).scheduled?
  end

  test "scheduled? returns true for scheduled blog post" do
    assert build(:blog_post, :scheduled).scheduled?
  end
end
