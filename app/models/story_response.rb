class StoryResponse < ApplicationRecord
  belongs_to :story
  belongs_to :user

  validate :check_for_same_user, on: :create

  default_scope -> { order(created_at: :desc) }

  def check_for_same_user
    same_id = user_id == story.user_id
    errors.add(:user, 'can not respond to own story') if same_id
  end

  def responder
    user.name
  end
end
