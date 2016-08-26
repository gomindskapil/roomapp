Rails.application.routes.draw do


  



 
  resources :reviews
  resources :rooms
  resources :photos

  root 'pages#home'


  devise_for :users,
             :path => '',
             :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
             :controllers => { :registrations => "registrations" } 
 resources :users, only: [:show]
 resources :rooms do
 	resources :reservations, only: [:create]
 end

 resources :conversations, only: [:index, :create] do
 	resources :messages, only: [:index, :create]
 end

 resources :rooms do
 	 resources :reviews, except: [:show, :index]
  end
get '/preload' => 'reservations#preload'
get '/preview' => 'reservations#preview' 
get '/your_trips' => 'reservations#your_trips' 
get '/your_reservations' => 'reservations#your_reservations' 
end
