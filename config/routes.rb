Rails.application.routes.draw do
  get 'connect_streams/connect'

  post 'uploads/upload_lead'
  post 'uploads/upload_contact'
  post 'uploads/upload_opportunity'
  post 'uploads/upload_campaign'
  post 'uploads/upload_account'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'fat_free_crm/home#index'
  mount FatFreeCrm::Engine, at: "/"
  # mount CallCenter::Engine, at: "/call_center"
end
