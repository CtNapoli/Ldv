Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope "(:locale)", locale: /it|\./  do
    root 'pages#home'

    get 'about'          => 'pages#about'

    get 'owners'         => 'pages#owners'

    resources :requests, only: [:create]

    resources :owner_requests, only: [:create]

    resources :apartments, only: [:index, :show] do
      resources :reservations, only: [:create]
    end

    # resources :apartments do
    #   member do
    #     get 'request_form'
    #     post 'create_request'
    #   end
    # end

    post '/apartments/:apartment_id', to: 'requests#create_request', as: 'create_request_for_apartment'

    get 'special-offer'   => 'apartments#special_offer'

    get 'on-selling'   => 'apartments#on_selling'
    
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
          post    '/aggiungi-range-prezzo-offerta'        =>  'apartments#add_price_range_offer', as: 'add_price_range_offer'
          delete  '/rimuovi_range_prezzo/:price_id'       =>  'apartments#remove_price_range', as: 'remove_price_range'
          delete  '/rimuovi_range_prezzo-offerta/:price_id' =>  'apartments#remove_price_range_offer', as: 'remove_price_range_offer'
          get     '/modifica-range-prezzo/:price_id'      =>  'apartments#edit_price_range', as: 'edit_price_range'
          patch   '/aggiorna-range-prezzo/:price_id'      =>  'apartments#update_price_range', as: 'update_price_range'
          get     '/modifica-range-prezzo-offerta/:price_id' =>  'apartments#edit_price_range_offer', as: 'edit_price_range_offer'
          patch   '/aggiorna-range-prezzo-offerta/:price_id' =>  'apartments#update_price_range_offer', as: 'update_price_range_offer'
        end
      end

      resources :reservations, only: [:index] do
        patch 'reject'  =>  'reservations#reject'
        patch 'accept'  =>  'reservations#accept'
      end
      
      resources :services
  
      resources :areas, only: [:index, :new, :create, :edit, :update] do
        member do
          delete  '/modifica/rimuovi-immagine-principale' =>  'areas#remove_main_photo', as: 'remove_main_image_area'
          delete  '/modifica/rimuovi-immagine'            =>  'areas#remove_photo', as: 'remove_photo_area'
        end
      end
  
      resources :questions
    end
  end

  get "/sitemap" => "sitemap#show"

  match '*unmatched_route', :to => 'application#page_not_found', :via => :all, constraints: lambda { |request| !request.path_parameters[:unmatched_route].start_with?('rails/') }
end
