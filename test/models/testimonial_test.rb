require "test_helper"

class TestimonialTest < ActiveSupport::TestCase
  test "draft? returns true for draft testimonial" do
    assert build(:testimonial).draft?
  end

  test "draft? returns false for published testimonial" do
    refute build(:testimonial, :published).draft?
  end

  test "published? returns false for draft testimonial" do
    refute build(:testimonial).published?
  end

  test "published? returns true for published testimonial" do
    assert build(:testimonial, :published).published?
  end
end
