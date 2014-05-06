AnaLog::Application.routes.draw do
  get '/' => 'web/reviews#index'
  get 'add' => 'web/reviews#add'
  post 'add' => 'web/reviews#create'

  scope 'game' do
    get 'add' => 'web/games#add'
  end
end
