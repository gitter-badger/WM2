Rails.application.routes.draw do

  devise_for :users
  resources :concepts do
    resources :reviews
  end

end
