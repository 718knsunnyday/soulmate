class PostComment < ApplicationRecord
  belongs_to :public
  belongs_to :farm
  validates :comment, presence: true
end
