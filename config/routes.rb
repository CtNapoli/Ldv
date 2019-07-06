Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|\./  do
    root 'pages#home'

    get 'owners'         => 'pages#owners'

    resources :requests, only: [:create]

    resources :owner_requests, only: [:create]

    resources :apartments, only: [:index, :show] do
      resources :reservations, only: [:create]
    end
    
    resources :areas, only: [:show]

    namespace :backend do
      get     'login'   => 'sessions#new'
      post    'login'   => 'sessions#create'
      delete  'logout'  => 'sessions#destroy'
  
      resources :apartments do
        member do
          delete  '/modifica/rimuovi-immagine-principale' =>  'apartments#remove_main_photo', as: 'remove_main_photo'
          delete  '/modifica/rimuovi-immagine'            =>  'apartments#remove_photo', as: 'remove_photo'
          post    '/aggiungi-range-prezzo'                =>  'apartments#add_price_range', as: 'add_price_range'
          delete  '/rimuovi_range_prezzo/:price_id'       =>  'apartments#remove_price_range', as: 'remove_price_range'
          get     '/modifica-range-prezzo/:price_id'      =>  'apartments#edit_price_range', as: 'edit_price_range'
          patch   '/aggiorna-range-prezzo/:price_id'      =>  'apartments#update_price_range', as: 'update_price_range'
        end
      end

      resources :reservations, only: [:index] do
        patch 'reject'  =>  'reservations#reject'
        patch 'accept'  =>  'reservations#accept'
      end
      
      resources :services
  
      resources :areas, only: [:index, :edit, :update] do
        member do
          delete  '/modifica/rimuovi-immagine-principale' =>  'areas#remove_main_photo', as: 'remove_main_image_area'
          delete  '/modifica/rimuovi-immagine'            =>  'areas#remove_photo', as: 'remove_photo_area'
        end
      end
  
      resources :questions
    end
  end
end
