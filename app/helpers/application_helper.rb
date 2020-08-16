module ApplicationHelper
  def show_response_count(story_response)
    story = story_response.story
    story.story_responses.where(user_id: story_response.user.id).count
  end
end
