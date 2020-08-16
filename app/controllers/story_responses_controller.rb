class StoryResponsesController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :set_story
  def create
    @story_response = set_story.story_responses.new(responses_params)
    respond_to do |format|
      if @story_response.save
        format.html { redirect_to set_story, notice: 'Thank you for your response' }
      else
        format.html { redirect_to set_story, alert: 'You can not respond to your own story' }
      end
    end
  end

  private

  def set_story
    Story.find(params[:story_id])
  end

  def responses_params
    params.require(:story_response).permit!
  end
end
