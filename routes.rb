resources :newsgrids, :only => :show
namespace :admin do |admin|
  admin.resources :newsgrids
end
