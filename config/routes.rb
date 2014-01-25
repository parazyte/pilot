Pilot::Application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  mount Resque::Server.new, at: '/resque'

  # Landing page
  root :to => 'cms/pages#index'

  namespace :cms do
    resources :pages, only: [:show, :index]
  end
end
