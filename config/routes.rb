Rails.application.routes.draw do

  get '/', to: 'shortened_urls#new'
  resources :shortened_urls, only: [ :create, :show ]
  get '/:vanity_path', to: 'shortened_urls#visit'

end
