Londontrumps::Application.routes.draw do
  # Front page
  root :to => 'lobbies#index'

  match 'games/switch' => 'games#switch'
  match 'pusher/auth' => 'pusher#auth'

  # Resourcces
  resources :games
  resources :lobbies

  # Route everything else by url
  match ':controller/:action'
  
end