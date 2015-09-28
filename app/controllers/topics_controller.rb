class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @topics = Topic.all
  end

  def show
    @contributors = @topic.users
  end

  def new
    @topic = Topic.new
    @user = current_user
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:success] = 'Topic added'
      redirect_to @topic
      @topic.users << @user
    else
      flash[:notice] = "Topic could not be saved"
      render :new
    end
  end

  def update
    if @topic.update(topic_params)
      flash[:success] = "Topic updated"
      redirect_to @topic
      @topic.users << @user unless @topic.users.include?(@user)
    else
      flash[:notice] = "Topic could not be updated"
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_url, notice: 'Topic was destroyed.'
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def topic_params
    params.require(:topic).permit(:title, :body)
  end
end
