Rails.application.routes.draw do


 devise_for :secures
  devise_for :admin

 namespace:'admin' do
   root "books#index"
   resources :books
   resources :plans
    # get "/admins", to: "admins#index"
  end

  root "books#index"
  resources :books, :only => [:index, :show] do
    collection do
      get 'subscribe_plan'
      post 'subscribe_plan'
      post'update_subscribe_plan'
    end 
  end


 

  get "/homes", to: "homes#index"
  

end
  