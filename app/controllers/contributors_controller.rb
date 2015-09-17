class ContributorsController < ApplicationController
  def index
    @contributors = User.all
  end

  def show
    @contributor = User.find(params[:id])
    @topics = @contributor.topics
  end
end
