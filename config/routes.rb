Rails.application.routes.draw do

  resources :posts

  get 'welcome/faq'

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
