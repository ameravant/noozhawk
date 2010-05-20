resources :newsgrids, :only => :show
namespace :admin do |admin|
  admin.resources :newsgrids do |newsgrid|
    newsgrid.resources :menus
  end
end