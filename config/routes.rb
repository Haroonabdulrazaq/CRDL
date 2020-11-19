Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "samples#index"
  resources :samples  do
    resources :results
  end

end
