

#map.namespace :admin do |admin|
#  admin.resources :reviews
#  admin.resource :review_settings
#end

#map.resources :products do |product|
#  product.resources :reviews # , :member => {:submit => :post}
#end


Rails.application.routes.draw do
  namespace :admin do
    resources :reviews
    resources :review_settings
  end
  
  resources :products do 
    resources :reviews do
      get :terms
      post :approve
    end
  end
end

