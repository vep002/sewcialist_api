Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :projects, :materials, only: [:index, :show, :create, :destroy, :update] do
    resources :steps, :materials, only: [:create, :destroy, :update]
    resources  only: [:add_material_to_project]
  end
end
