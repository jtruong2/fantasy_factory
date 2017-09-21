Rails.application.routes.draw do
  root to: 'home#index'

  get '/fight-to-the-death', as: "nfl_player_show", to: 'nfl_player#show'
end
