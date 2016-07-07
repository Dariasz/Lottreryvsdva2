Rails.application.routes.draw do

  get 'myitems' => 'myitems#index'
  get '/draw' => 'items#draw'
  resources :items do
member do
  get 'draw'
  post 'bid'
  end
end

  devise_for :users
  get 'welcome/index'
  root 'welcome#index'


  if Rails.env.development?
     mount LetterOpenerWeb::Engine, at: "/letter_opener"
   end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
