
class LikesController < ApplicationController
  def index
  		@newlike = Like.new()
  		@newlike.user_id = current_user.id
  		@newlike.answer_id = params[:answer_id]
      @dislike = Dislike.where(:user_id => current_user.id, :answer_id => params[:answer_id])



      if @dislike.count != 0
        Dislike.destroy(@dislike)
      end
  		if @newlike.save
        if params[:frompage] == 'answeredquestions'
          redirect_to questions_answeredque_path
        else
  			redirect_to question_path(params[:question_id])
        end
  		end 
  	end


  def destroy
  	@newlike = Like.where(:user_id => current_user.id, :answer_id => params[:answer_id])
  	Like.destroy(@newlike)
  	redirect_to question_path(params[:question_id])

  end
end
