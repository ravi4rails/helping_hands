class StoryResponse < ApplicationRecord
  belongs_to :story
  belongs_to :user

  validate :check_for_same_user, on: :create

  def check_for_same_user
    same_id = user_id == story.user_id
    errors.add('', 'User can not respond to own story') if same_id
  end
end
