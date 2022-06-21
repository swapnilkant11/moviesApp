Rails.application.routes.draw do
  get 'movies/home'
  get 'movies/show_movies/:id', to: "movies#show_movies"
  delete 'movies/remove_movie/:id', to: "movies#remove_movie"

  devise_for :models
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
