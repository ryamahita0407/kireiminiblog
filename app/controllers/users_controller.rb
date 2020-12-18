class UsersController < ApplicationController

  def show
    @miniblogs = current_user.miniblogs.page(params[:page]).per(4)
  end
end
