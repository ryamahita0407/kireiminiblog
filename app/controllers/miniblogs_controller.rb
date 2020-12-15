class MiniblogsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    
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

  private
  def miniblog_params
    params.require(:miniblog).permit(:title, :text, images: []).merge(user_id: current_user.id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
