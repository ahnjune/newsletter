ActionController::Routing::Routes.draw do |map|
  
  map.namespace :admin do |admin|
    admin.resources :feeds, :member => "fetch"
    admin.resources :feed_items
    admin.root :controller => "feeds"
  end

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  
  map.resources :users
  map.resource :session
  map.resource :account
  map.resources :tags

  map.root :controller => "accounts", :action => "edit"

end
