resources :newsgrids, :only => :show
namespace :admin do |admin|
  admin.resources :newsgrids, :has_many => { :features, :menus } do |newsgrid|
    newsgrid.resources :menus
    newsgrid.resources :images, :member => { :reorder => :put }, :collection => { :reorder => :put }
  end
end