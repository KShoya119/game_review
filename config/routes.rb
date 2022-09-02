Rails.application.routes.draw do
  namespace :admin do
    resources :customers, only: [:index, :show, :update]
  end
  namespace :admin do
    resources :reviews, only: [:index, :show, :destroy]
  end

  root to: 'public/homes#top'

  get 'reviews/destroy'
  scope module: :public do
    resources :reviews, only: [:index, :new, :create, :show, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

devise_for :admins, controllers: {
  sessions:      'admin/admins/sessions',
  passwords:     'admin/admins/passwords',
  registrations: 'admin/admins/registrations'
}
devise_for :customers, controllers: {
  sessions:      'public/customers/sessions',
  passwords:     'public/customers/customers/passwords',
  registrations: 'public/customers/registrations'
}
devise_scope :customer do
  post 'customers/guest_sign_in', to: 'public/customers/sessions#guest_sign_in'
end

  scope module: :public do
    resources :customers, only: [:show] do
      member do
        get :favorites
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
