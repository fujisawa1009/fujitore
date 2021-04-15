class CommentsController < ApplicationController

  prepend_before_action :set_commentable, only: %i[create]
  before_action :authenticate_user!, only: %i[create edit update destroy]
  # before_action :set_comment, only: %i[edit update destroy]  

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
      flash[:success] = 'コメントの編集しました。'
      if @comment.gym_id.nil?
        redirect_to trainer_path(@comment.trainer_id)
      elsif @comment.trainer_id.nil?
        redirect_to gym_path(@comment.gym_id)
      else
        redirect_to user_path(@comment.user_id)
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = '投稿へのコメントを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :content, :rate)
  end

end
