Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome', to: 'misc_pages#welcome', as: 'welcome'
  
  resources :page_scans, only: [:index, :show, :destroy]
  resources :webpages do
    member do
      get :validate_html
    end
  end
  resources :websites
  root to: redirect('/welcome', status: 302)
end
