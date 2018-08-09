Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  require 'crono/web'
  mount Crono::Web, at: '/crono'

  get 'hello', to: 'application#hello'
  get 'goodbye', to: 'application#goodbye'
  get 'fire', to: 'application#fire_worker'

end
