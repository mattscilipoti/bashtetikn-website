Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'welcome', to: 'misc_pages#welcome', as: 'welcome'

  Rails.logger.debug "In routes: PageScan.descendants==#{PageScan.descendants.collect(&:name)}"

  resources :page_scans, only: [:index, :show, :destroy]
  resources :webpages do
    PageScan.descendants.each do |page_scan_class|
      page_scan_route = page_scan_class.name.underscore
      Rails.logger.debug "Adding route, webpages GET #{page_scan_route}"
      get page_scan_route, on: :member
    end
  end
  resources :websites do
    PageScan.descendants.each do |page_scan_class|
      page_scan_route = page_scan_class.name.underscore
      Rails.logger.debug "Adding route, websites GET #{page_scan_route}"
      get page_scan_route, on: :member
    end
  end
  root to: 'misc_pages#welcome'
end
