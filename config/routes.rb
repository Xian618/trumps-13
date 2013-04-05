Londontrumps::Application.routes.draw do
  #get "cards/index"
  #get "cards/show"
  #get "cards/create"
  #get "cards/delete"
  #get "cards/new"
  #get "cards/edit"
  #get "cards/update"

  # Front page
  root :to => 'lobbies#index'

  match 'games/switch' => 'games#switch'
  match 'pusher/auth' => 'pusher#auth'
  match 'lobbies/queue' => 'lobbies#queue'

  # Resources
  resources :cards
  resources :games
  resources :lobbies
  resource  :players

  # Route everything else by url
  match ':controller/:action'
  
end
