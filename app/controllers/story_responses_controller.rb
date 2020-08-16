class StoryResponsesController < ApplicationController
  before_action :set_story
  def create
    @story_response = set_story.story_responses.create(responses_params)
    respond_to do |format|
      format.html { redirect_to set_story, notice: 'Thank you for your response' }
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
