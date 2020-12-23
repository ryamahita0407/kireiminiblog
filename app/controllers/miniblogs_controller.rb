class MiniblogsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_miniblog, only: [:show, :destroy, :edit, :update]

  def index
    @miniblogs = Miniblog.includes(:user).order("created_at DESC").page(params[:page]).per(3)
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
    @comment = Comment.new
    @comments = @miniblog.comments.includes(:user)
    @like = Like.new
  end

  def destroy
    if user_signed_in? && @miniblog.user_id == current_user.id
      @miniblog.destroy
      redirect_to root_path
    end
  end

  def edit
    if user_signed_in? && @miniblog.user_id == current_user.id
    else
      redirect_to root_path
    end 
  end
  def update
    if user_signed_in? && @miniblog.user_id == current_user.id
      @miniblog.update(miniblog_params)
      if @miniblog.valid?
        redirect_to root_path
      else
        render 'edit'
      end
    else
      redirect_to root_path
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

  def set_miniblog
    @miniblog = Miniblog.find(params[:id])
  end
end
