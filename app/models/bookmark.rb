class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  validates :movie, presence: true
  validates :list, presence: true
  validates :comment, length: { minimum: 6 }, allow_blank: true
  validates_uniqueness_of :list, scope: :movie
end
