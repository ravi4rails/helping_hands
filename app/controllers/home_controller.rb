class HomeController < ApplicationController
  def index
    @stories = Story.limit(10)
  end

  def learn_more; end
end
