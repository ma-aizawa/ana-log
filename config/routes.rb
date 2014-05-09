AnaLog::Application.routes.draw do
  get '/' => 'web/plays#index', as: :play_history

  scope 'game' do
    get '/' => 'web/games#index', as: :game_list
    get 'add' => 'web/games#add', as: :add_game
    post 'add' => 'web/games#create', as: :register_game
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
