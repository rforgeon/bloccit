Rails.application.routes.draw do

  resources :posts

  resources :advertisement

  get 'welcome/faq'

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
