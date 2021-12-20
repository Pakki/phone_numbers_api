Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :phone_numbers, only: %i[index create]
      get 'phone_numbers/find/:number', to: 'phone_numbers#find'
    end
  end
end
