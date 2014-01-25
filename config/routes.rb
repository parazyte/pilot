Pilot::Application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  mount Resque::Server.new, at: '/resque'

  # Landing page
  root :to => 'cms_pages#index'

  resources :cms_pages
end
