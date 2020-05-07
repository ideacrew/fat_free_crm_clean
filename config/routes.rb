Rails.application.routes.draw do
  get 'connect_streams/index'

  post 'fat_free_crms/upload_lead'
  post 'fat_free_crms/upload_contact'
  post 'fat_free_crms/upload_opportunity'
  post 'fat_free_crms/upload_campaign'
  post 'fat_free_crms/upload_account'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  # mount CallCenter::Engine, at: "/call_center"
end
