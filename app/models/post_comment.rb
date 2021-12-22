class PostComment < ApplicationRecord
  belongs_to :public
  belongs_to :farm
  validates :comment, presence: true
  validates :rate, numericality: { in: 1..5 }
end
