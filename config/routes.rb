Rails.application.routes.draw do
  get 'restaurants', to: 'restaurants#index'
  get 'restaurants/new', to: 'restaurants#new'
  post 'restaurants', to: 'restaurants#create'

  get 'restaurants/:id', to: 'restaurants#show', as: :restaurant
  # nesting manually by typing the url/nested
  get 'restaurants/:restaurant_id/reviews/new', to: 'reviews#new', as: :new_review
  post 'restaurants/:restaurant_id/reviews', to: 'reviews#create', as: :reviews
end
