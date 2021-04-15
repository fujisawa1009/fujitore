class Gyms::CommentsController < CommentsController

  private

    def set_commentable  
      @commentable = Gym.find(params[:gym_id])  
    end  

end