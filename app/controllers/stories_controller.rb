class StoriesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_story, only: %i[show edit update destroy]

  def index
    @stories = resource_class.all
  end

  def show; end

  def new
    @story = resource_class.new
  end

  def edit; end

  def create
    @story = current_user.stories.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def resource_class
    Story
  end

  def set_story
    @story = resource_class.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :description)
  end
end
