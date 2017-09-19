Rails.application.routes.draw do
  root to: 'home#index'

  get '/fight-to-the-death', as: "search", to: 'search#show'
end
