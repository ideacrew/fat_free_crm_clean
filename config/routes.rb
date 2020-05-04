Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'fat_free_crm/home#index'
  mount FatFreeCrm::Engine, at: "/"
  mount CallCenter::Engine, at: "/call_center"
end