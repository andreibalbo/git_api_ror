Rails.application.routes.draw do
  resources :repositories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/get_trend' => 'repositories#get_trend'
  get '/list_trend' => 'repositories#list_trend'

  resources :list_trend
  resources :get_details
  resources :connect
  resources :connect2
end
