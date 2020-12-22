class MiniblogsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @miniblogs = Miniblog.includes(:user).order("created_at DESC").page(params[:page]).per(4)
    @all_ranks = Miniblog.find(Like.group(:miniblog_id).order('count(miniblog_id) desc').limit(3).pluck(:miniblog_id))
  end

  def new
    @miniblog = Miniblog.new
  end

  def create
    @miniblog = Miniblog.new(miniblog_params)
    if @miniblog.valid?
      @miniblog.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @miniblog = Miniblog.find(params[:id])
    @comment = Comment.new
    @comments = @miniblog.comments.includes(:user)
    @like = Like.new
  end

  def destroy
    @miniblog = Miniblog.find(params[:id])
    if user_signed_in? && @miniblog.user_id == current_user.id
      @miniblog.destroy
      redirect_to root_path
    end
  end

  def edit
    @miniblog = Miniblog.find(params[:id])
  end
  def update
    @miniblog = Miniblog.find(params[:id])
    @miniblog.update(miniblog_params)
    if @miniblog.valid?
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def miniblog_params
    params.require(:miniblog).permit(:title, :text, images: []).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
