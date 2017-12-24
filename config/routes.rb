Rails.application.routes.draw do



  root 'page#home'

  devise_for :users,:controllers => { :registrations => 'registrations' } 

  resources :users, only: [:show]
  resources :rooms 
  

end
