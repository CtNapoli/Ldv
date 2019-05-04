Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|\./  do
    root 'pages#home'

    get 'owners'         => 'pages#owners'

    resources :requests, only: [:create]

    resources :owner_requests, only: [:create]

    resources :apartments, only: [:index, :show]
    
    resources :areas, only: [:show]

    namespace :backend do
      get     'login'   => 'sessions#new'
      post    'login'   => 'sessions#create'
      delete  'logout'  => 'sessions#destroy'

      resources :apartments, path: 'appartamenti' do
        member do
          delete  '/modifica/rimuovi-immagine-principale' =>  'apartments#remove_main_photo', as: 'remove_main_photo'
          delete  '/modifica/rimuovi-immagine'            =>  'apartments#remove_photo', as: 'remove_photo'

          resources :prices
        end
      end
      
      resources :services, path: 'servizi'

      resources :areas, path: 'aree', only: [:index, :edit, :update] do
        member do
          delete  '/modifica/rimuovi-immagine-principale' =>  'areas#remove_main_photo', as: 'remove_main_image_area'
          delete  '/modifica/rimuovi-immagine'            =>  'areas#remove_photo', as: 'remove_photo_area'
        end
      end
    end
  end
end
