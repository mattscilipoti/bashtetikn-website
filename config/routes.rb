Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome', to: 'misc_pages#welcome', as: 'welcome'

  resources :page_scans, only: [:index, :show, :destroy]
  resources :webpages do
    member do
      get :validate_html
    end
  end
  resources :websites do
    Rails.logger.debug "In routes: PageScan.descendants==#{PageScan.descendants.collect(&:name)}"
    PageScan.descendants.each do |page_scan_class|
      page_scan_route = page_scan_class.name.underscore
      Rails.logger.debug "Adding route, websites GET #{page_scan_route}"
      get page_scan_route, on: :member
    end
  end
  root to: redirect('/welcome', status: 302)
end
