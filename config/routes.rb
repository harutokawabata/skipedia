Rails.application.routes.draw do
  
  # namespace :public do
  #   get 'users/show'
  #   get 'users/edit'
  #   get 'users/update'
  # end
  # namespace :admins do
  #   get 'users/index'
  #   get 'users/show'
  # end
  
  scope module: :public do
    resource :users, only: [:edit, :show, :update]
    get '/users/unsubscribe' => 'users#unsubscribe', as: 'users_unsbscribe'
    patch '/users/withdraw' => 'users#withdraw', as: 'users_withdraw'
  end
  
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
      resources :genres, only: [:index, :create, :edit, :update, :destroy]
      resources :tags, only: [:index, :create, :edit, :update, :destroy]
      resources :events, only: [:index, :new, :show, :create, :edit, :update, :destroy]
      resources :users, only: [:index, :edit, :update, :destroy, :show]
      # get 'users/confirm/:id' => 'admins/users#confirm'
    end
    
    # post '/orders/confirm' => 'orders#confirm'
    get 'admins/users/confirm/:id' => 'admins/users#confirm',  as: 'admins_confirm'

    get '/admins' => 'admins/homes#top'
    root 'public/homes#top'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
