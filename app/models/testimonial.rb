class Testimonial < ApplicationRecord
  validates :name, :city, :content, presence: true

  scope :sorted, -> { order(arel_table[:published_at].desc.nulls_first, updated_at: :desc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where.not(published_at: nil) }

  def draft?
    published_at.nil?
  end
end
