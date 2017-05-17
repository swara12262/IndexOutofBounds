class DislikesController < ApplicationController
  def index
  		@newdislike = Dislike.new()
  		@newdislike.user_id = current_user.id
  		@newdislike.answer_id = params[:answer_id]
      @like = Like.where(:user_id => current_user.id, :answer_id => params[:answer_id])
      if @like.count != 0
        Like.destroy(@like)
      end
  		if @newdislike.save
        if params[:frompage] == 'answeredquestions'
          redirect_to questions_answeredque_path
        else
          redirect_to question_path(params[:question_id])  
    		end 
  	end
end
  

  def destroy
  	@newdislike = Dislike.where(:user_id => current_user.id, :answer_id => params[:answer_id])
  	Dislike.destroy(@newdislike)
  	redirect_to question_path(params[:question_id])

  end
end
