Londontrumps::Application.routes.draw do
  get "game/index"

  # Front page
  root :to => 'game#index'

  # Resourcces
  resource :game

  # Route everything else by url
  match ':controller/:action'
  
end