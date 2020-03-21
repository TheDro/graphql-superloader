class Review < ApplicationRecord
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }
  validates :comment, presence: true
  belongs_to :reviewable, polymorphic: true

end
