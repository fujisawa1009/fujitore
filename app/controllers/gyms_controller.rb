class GymsController < ApplicationController

  def index
    @q = Gym.ransack(params[:q])
    @gyms = @q.result(distinct: true).includes(:district, :categories).page(params[:page]).per(GYM_PAGE)
    @districts = District.all
    @categories = Category.all
    end


  def show
    @gym = Gym.preload(:item_images, trainers: {trainer_categories: :category, comments: :user}, gym_categories: :category).find(params[:id])
    @comments = @gym.comments.preload(:user).all.page(params[:page]).per(4).order('updated_at DESC')
    @comment = @gym.comments.build
  end

end