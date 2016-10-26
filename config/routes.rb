Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
  end

  get 'welcome/faq'

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
