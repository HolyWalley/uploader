Rails.application.routes.draw do
  resources :files, only: :new
end
