class MyquestionsController < ApplicationController
  def index
  	@questions = Question.all
  	   @userdtl = Userdetail.all
     if !Userdetail.exists?(user_id: current_user.id) 
        redirect_to new_userdetail_path 
      end
 
  end
end
