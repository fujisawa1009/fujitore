class StaticPagesController < ApplicationController

  def home
    @gyms = Gym.preload(:district).order(created_at: :desc).limit(4)
    @trainers = Trainer.preload(trainer_categories: :category, comments: :user).order(created_at: :desc).limit(10)
    # @districts = District.all
    # @categories = Category.all
  end

end
