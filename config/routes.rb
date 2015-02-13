Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'sessions' }

  resources :concepts do
    resources :reviews
  end

end
