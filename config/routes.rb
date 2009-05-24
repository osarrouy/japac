ActionController::Routing::Routes.draw do |map|

  map.namespace :admin do |admin|
    admin.resources :events, :except => [ :show, :update ], :has_many => :photos,
      :member => { :generic => :get, :technical => :get, :photos => :get, :edit_generic => :get, :edit_technical => :get,
        :update_generic => :put, :update_technical => :put }
    admin.resources :references, :except => [ :show, :update ], :has_many => :photos,
      :member => { :generic => :get, :technical => :get, :localisation => :get, :photos => :get, :edit_generic => :get, :edit_technical => :get, :edit_localisation => :get, 
        :update_generic => :put, :update_technical => :put, :update_localisation => :put }
    admin.resources :photos
    admin.resources :users
    admin.resources :publications
    admin.resources :locations, :collection => { :geocode => :get }
    admin.resource 	:contact
  end

  map.resources :references,
    :collection => { :get_random_small_photo => :get, :get_random_medium_photo => :get, :size_form => :get, :map => :get }
  map.resources :events,
    :collection => { :get_random_small_photo => :get, :get_random_medium_photo => :get }
  map.resources :photos, :collection => { :event_medium => :get, :reference_medium => :get }
  map.resources :publications
  map.resource	:contact

  map.resource  :session
  
  map.login  '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.admin '/admin', :controller => 'admin/events', :action => 'index'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format', :defaults => { :controller => 'index', :action => 'index' }
  map.connect '', :controller => 'index', :action => 'index'


end
