Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'quotes/:search_tag', to: 'quotes#show'
end
