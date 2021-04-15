class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.preload(:trainer).all.page(params[:page]).per(4).order('updated_at DESC')
    @trainers = @user.liked_trainers.preload(trainer_categories: :category, comments: :user).all.page(params[:page]).per(6)
  end

end
