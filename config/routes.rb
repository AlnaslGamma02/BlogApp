Rails.application.routes.draw do

  root 'static_pages#home'

  get '/help',  to: 'static_pages#help'
  get '/about', to: 'static_pages#about'

  devise_for :users
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :articles do
    resources :comments
  end
end
