Rails.application.routes.draw do
 
  resources :projects
  get 'dislikes/index'

  get 'dislikes/destroy'

  get 'likes/index'

  get 'likes/destroy'

  get 'likes/destroy', to: "likes#destroy"

  get 'myquestions/index'

  get 'questions/answeredque'  

  get 'questions/myquestionsindex'
  
  get 'questions/interestwisequestions'

  get 'questions/changetext'

  get 'questions/searchtext'


  get 'home/aboutus'

root  "home#index"
 




  resources :questions do
  		resources :answers
  	end
  	
  resources :userdetails
  devise_for :users, controllers: { registrations: "registrations" }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
