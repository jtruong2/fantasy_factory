Rails.application.routes.draw do
  root to: 'home#index'

  namespace :nfl do
    get '/nfl-dashboard', as: 'dashboard', to: 'nfl_dashboard#index'
    get '/fight-to-the-death', as: "player_show", to: 'nfl_player#show'
  end

end
