Rails.application.routes.draw do
  resources :stories do
    resources :story_responses
  end
  root 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/learnmore' => 'home#learn_more'
end
