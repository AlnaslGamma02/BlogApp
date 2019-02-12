Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/index'

  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'

  resources :articles do
    resources :comments
  end

end
