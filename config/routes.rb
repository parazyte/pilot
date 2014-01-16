Pilot::Application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  # Landing page
  root :to => 'dashboard#index'

  resources :games, only: [:show]
end
