Rails.application.routes.draw do
  get 'organ_systems/index'
  get 'organ_systems/show'
  get 'organ_systems/create'
  get 'home/index'
  root 'home#index'
  get 'organ_systems/female_index' => 'organ_systems#female_index'
  get 'organ_systems/male_index' => 'organ_systems#male_index'

  get 'organ_systems/nasopharynx' => 'organ_systems#modal1_trigger', as: 'fnasopharynx'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
