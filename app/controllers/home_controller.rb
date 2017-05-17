class HomeController < ApplicationController
  def index

     if user_signed_in?
  	 	if Userdetail.exists?(user_id: current_user.id)
           
      			redirect_to  questions_path
      	else
      			redirect_to new_userdetail_path 
      	end

    else
      redirect_to new_user_session_path
    end

  end

  def aboutus 
      @userdtl=Userdetail.all
     
  end
end
