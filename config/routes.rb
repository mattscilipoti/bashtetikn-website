Rails.application.routes.draw do
  resources :websites
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome', to: 'misc_pages#welcome', as: 'welcome'

  root to: redirect('/welcome', status: 302)
end
