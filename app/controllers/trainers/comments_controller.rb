class Trainers::CommentsController < CommentsController

  private

    def set_commentable  
      @commentable = Trainer.find(params[:trainer_id])  
    end  

end