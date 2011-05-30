IMSRails3::Application.routes.draw do
  
  resources :users do
    collection  do
      post 'verify_login'
      get 'search'
    end
  end

  resources :interviews do
    collection do
      get 'csv_upload'
      post 'import_csv'      
      get 'search'
    end    
  end
  match 'interview/:id/download_attachment/:attachment_id' => "interviews#download_attachment",:as=>"download_attachment"
  match 'interview/upload_personal_doc/:id' => "interviews#upload_personal_doc",:as=>"upload_personal_doc"

  match 'interview/import_personal_doc/:id' => "interviews#import_personal_doc",:as=>"import_personal_doc"
  match 'interview/index' => "interviews#get_content_to_display",:as=>"get_content_to_display"

  match 'logout' => "users#logout",:as=>"logout"
  root :to => "users#login"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
