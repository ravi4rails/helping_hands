class Story < ApplicationRecord
  has_many :story_responses, dependent: :destroy
  belongs_to :user
  validates :title, :description, presence: true
end
