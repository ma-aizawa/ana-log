AnaLog::Application.routes.draw do
  get '/' => 'web/plays#index', as: :play_history

  post '/login' => 'web/users#login', as: :login
  get '/logout' => 'web/users#logout', as: :logout

  scope 'game' do
    get '/' => 'web/games#index', as: :game_list
    get 'add' => 'web/games#add', as: :add_game
    post 'add' => 'web/games#create', as: :register_game
    get 'edit/:id' => 'web/games#edit', as: :edit_game
    patch 'edit/:id' => 'web/games#update', as: :update_game
  end

  scope :reviews do
    get 'add/:play_id' => 'web/reviews#add', as: :add_review
    post 'add/:play_id' => 'web/reviews#create', as: :create_review
    patch 'add/:play_id' => 'web/reviews#create', as: :update_review
  end

  namespace :api do
    scope :game do
      get '/search' => 'games#search', as: :search_game
    end

    scope :play do
      post 'add' => 'plays#create', as: :create_play
    end
  end
end
