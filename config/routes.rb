Rails.application.routes.draw do

  get '/messages/requests/read' => 'messages#indexrequest', as: :readrequest
  resources :messages
  resources :cmaterials
  resources :teaches
  resources :enrollments
  resources :courses
  resources :instructors
  resources :students
  resources :admins

  get '/courses/:id' => 'courses#show', as: :displaycourse
  get '/enrollments/course/:id'  => 'enrollments#showcourse', as: :displayenrollmentforcourse
  get '/courses/:id/coursecmaterials' => 'courses#showcoursecoursematerial', as: :displaycoursecoursematerial
  get '/enrollments/course/:id/new' => 'enrollments#newenrollmenttocoure', as: :newcourseenrollment
  post '/enrollments/student/:c_id' => 'enrollments#createstudentenrollment', as: :newstudentcourseenrollment
  get '/teaches/new/course/:c_id' => 'teaches#newteachescourse', as: :addnewinstructortocourse
  get '/messages/request/new' => 'messages#newrequest' , as: :newrequest

  get 'sessions/new'

  resources :users

  root 'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'signup'  => 'students#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  resources :students do
    collection do
      post 'show_course_history'
    end
  end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
