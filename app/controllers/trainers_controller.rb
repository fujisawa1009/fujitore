class TrainersController < ApplicationController

  def index
    @q = Trainer.ransack(params[:q])
    @trainers = @q.result(distinct: true).includes(:districts, :categories, comments: :user).page(params[:page]).per(TRA_PAGE)
    @districts = District.all
    @categories = Category.all
  end


  def show
    @trainer = Trainer.preload(:districts, trainer_categories: :category, gyms: {gym_categories: :category}).find(params[:id])
    @comments = @trainer.comments.preload(:user).all.page(params[:page]).per(3).order('updated_at DESC')
    @comment = @trainer.comments.build
    @like = Like.new
  end

end
