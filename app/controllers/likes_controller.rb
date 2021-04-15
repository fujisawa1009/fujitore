class LikesController < ApplicationController

  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @like = current_user.likes.create(trainer_id: params[:trainer_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(trainer_id: params[:trainer_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
  
end
