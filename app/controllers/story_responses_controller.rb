class StoryResponsesController < ApplicationController
  before_action :set_story
  def create
    @story_response = set_story.story_responses.create(responses_params)
    respond_to do |format|
      format.js
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
