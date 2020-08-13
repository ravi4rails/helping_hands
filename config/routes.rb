Rails.application.routes.draw do
  resources :stories
  root 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/learnmore' => 'home#learn_more'
end
