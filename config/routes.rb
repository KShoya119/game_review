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

  get 'fovorites/index' => 'public/fovorites/index'
  get 'fovorites/create'
  get 'fovorites/destroy'

  get 'review_comment/create'
  get 'review_comment/destroy'

  get 'reviews/index'
  get 'reviews/new' => 'public/reviews#new'
  get 'reviews/create'
  get 'reviews/show'
  get 'reviews/update'
  get 'reviews/destroy'

  get 'customers/show'
  get 'customers/withdrawal'

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
