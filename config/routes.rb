Rails.application.routes.draw do
  get 'connect_streams/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  # mount CallCenter::Engine, at: "/call_center"
end
