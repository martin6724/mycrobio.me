Rails.application.routes.draw do
  get 'organ_systems/index'
  get 'organ_systems/show'
  get 'organ_systems/create'
  get 'home/index'
  root 'home#index'
  get 'organ_systems/female_index'
  get 'organ_systems/male_index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
