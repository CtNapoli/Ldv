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

    get     'appartamenti'                                          =>  'apartments#index', as: 'all_apartments'
    get     'appartamento/:id/modifica'                             =>  'apartments#edit', as: 'edit_apartment'
    get     'appartamento/nuovo'                                    =>  'apartments#new', as: 'new_apartment'
    post    'appartamenti'                                          =>  'apartments#create', as: 'create_apartment'
    delete  'appartamento/:id'                                      =>  'apartments#destroy', as: 'destroy_apartment'
    patch   'appartamento/:id'                                      =>  'apartments#update', as: 'update_apartment'
    delete  'appartamento/:id/modifica/rimuovi-immagine-principale' =>  'apartments#remove_main_photo', as: 'remove_main_photo'
    delete  'appartamento/:id/modifica/rimuovi-immagine'            =>  'apartments#remove_photo', as: 'remove_photo'

    get     'servizi'                       =>  'services#index', as: 'services'
    get     'servizi/nuovo'                 =>  'services#new', as: 'new_service'
    get     'servizi/:id/modifica'          =>  'services#edit', as: 'edit_service'
    post    'servizi'                       =>  'services#create', as: 'create_service'
    patch   'servizio/:id'                  =>  'services#update', as: 'update_service' 
    delete  'servizio/:id'                  =>  'services#destroy', as: 'destroy_service'

    get     'aree'                                          =>  'areas#index', as: 'areas'
    get     'aree/:id/modifica'                             =>  'areas#edit', as: 'edit_area'
    patch   'area/:id'                                      =>  'areas#update', as: 'update_area'
    delete  'area/:id/modifica/rimuovi-immagine-principale' =>  'areas#remove_main_photo', as: 'remove_main_image_area'
    delete  'area/:id/modifica/rimuovi-immagine'            =>  'areas#remove_photo', as: 'remove_photo_area'
  end
end
