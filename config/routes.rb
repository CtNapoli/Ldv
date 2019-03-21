Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  post 'send-request' => 'requests#create'

  get 'appartamenti'  =>  'apartments#index', as: 'apartments'
  get 'appartamenti/:id'  =>  'apartments#show', as: 'apartment'

  namespace :backend do
    get     'login'   => 'sessions#new'
    post    'login'   => 'sessions#create'
    delete  'logout'  => 'sessions#destroy'

    get     'appartamenti' =>  'apartments#index', as: 'apartments'
  end
end
