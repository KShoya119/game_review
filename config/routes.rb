Rails.application.routes.draw do
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
  end
  namespace :admin do
    get 'reviews/index'
    get 'reviews/destroy'
    get 'reviews/show'
  end

  root to: 'public/homes#top'


  get 'reviews/update'
  get 'reviews/destroy'
  scope module: :public do
    resources :reviews, only: [:index, :new, :create, :show] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end


  get 'customers/withdrawal'
  scope module: :public do
    resources :customers, only: [:show] do
      member do
        get :favorites
      end
    end
  end


  post 'review_genre_intermediates' => 'public/review_genre_intermediates#create'

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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
