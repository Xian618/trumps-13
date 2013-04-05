Londontrumps::Application.routes.draw do
  # Front page
  root :to => 'lobbies#index'

  match 'games/switch' => 'games#switch'
  match 'pusher/auth' => 'pusher#auth'
  match 'lobbies/queue' => 'lobbies#queue'

  # Resourcces
  resources :games
  resources :lobbies
  resource  :players

  # Route everything else by url
  match ':controller/:action'
  
end
