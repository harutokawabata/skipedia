Rails.application.routes.draw do
  
  namespace :admins do
    get 'questions/index'
    get 'questions/show'
  end
  namespace :admins do
    get 'histories/index'
    get 'histories/show'
    get 'histories/destroy'
  end
  namespace :admin do
    get 'histories/index'
    get 'histories/show'
    get 'histories/destroy'
  end
  # namespace :public do
  #   get 'answers/index'
  #   get 'answers/edit'
  #   get 'answers/create'
  #   get 'answers/update'
  #   get 'answers/destroy'
  # end
  # namespace :public do
  #   get 'events/index'
  #   get 'events/show'
  #   get 'events/confirm'
  #   get 'events/withdraw'
  #   get 'events/cancel'
  # end
  scope module: :public do
    resource :users, only: [:edit, :show, :update]
    get '/users/unsubscribe' => 'users#unsubscribe', as: 'users_unsbscribe'
    patch '/users/withdraw' => 'users#withdraw', as: 'users_withdraw'
    # ここから履歴用のviewのurl
    # get 'users/:id/questions' => 'users#history', as: 'users_questions'
    get 'users_questions' => 'users#history_question'
    get 'users_posts' => 'users#history_post'
    get 'users_answers' => 'users#history_answer'
    get 'users_return_answers' => 'users#history_return_answer'
    #検索機能(questions)
    get 'questions_search' => 'questions#search'
    get 'posts_search' => 'posts#search'
    get 'answers_search' => 'answers#search'

    resources :questions, only: [:index, :edit, :new, :create, :show, :update, :destroy]
    resources :posts, only: [:index, :edit, :new, :create, :show, :update, :destroy]
    resources :events, only: [:index, :edit, :new, :create, :show, :update, :destroy]
    post 'events/confirm' => 'events#confirm', as: 'events_confirm'
    get 'events/:id/cancel' => 'events#cancel', as: 'events_cancel'
    # get 'events/:id/confirm' => 'events#confirm', as: 'events_confirm'
    get 'events/:id/withdraw' => 'events#withdraw', as: 'events_withdraw'
    resources :answers, only: [:index, :edit, :create, :show, :update, :destroy]
    get '/answers/:question_id/new' => 'answers#new', as: 'new_answer'
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
      patch 'users/withdraw/:id' => 'users#withdraw', as: 'users_withdraw'
      resources :post_images, only: [:new, :create, :index, :show, :destroy]
      resources :histories, only: [:index, :show, :destroy]
      resources :questions, only: [:index, :show, :destroy]
      get 'users/search' => 'users#search', as: 'users_search'
      # get 'users/confirm/:id' => 'admins/users#confirm'
    end
    
    # post '/orders/confirm' => 'orders#confirm'
    get 'admins/users/confirm/:id' => 'admins/users#confirm',  as: 'admins_confirm'

    get '/admins' => 'admins/homes#top'
    root 'public/homes#top'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
