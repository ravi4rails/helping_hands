module ApplicationHelper
  def flash_class(level)
    case level
      when :success then 'alert alert-success'
      when :notice then 'alert alert-success'
      when :alert then 'alert alert-danger'
      when :error then 'alert alert-danger'
      when :warning then 'alert alert-warning'
    end
  end

  def show_response_count(story_response)
    story = story_response.story
    story.story_responses.where(user_id: story_response.user.id).count
  end
end
