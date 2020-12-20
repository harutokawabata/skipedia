Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/passwords',
      registrations: 'admins/registrations'
    }
  # devise_scope :admins do
  #   get '/admins/sign_out' => 'devise/sessions#destroy'
  # end
    
devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'
    }
    
    namespace :admins do
      resources :genres, only: [:index, :show, :create, :edit]
    end

    get '/admins' => 'admins/homes#top'
    root 'public/homes#top'
      
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
