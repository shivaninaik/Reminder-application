Reminder::Application.routes.draw do
  get "monitor/index"

  get 'admin' => 'admin#index'
  
  controller :sessions do 
    get 'login' => :new 
    post 'login' => :create 
    delete 'logout' => :destroy
  end
  
  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  resources :users

  resources :alerts
  
  root :to => 'monitor#index', :as => 'monitor'
end
