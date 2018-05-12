Rails.application.routes.draw do
  get 'organ_systems/index'
  get 'organ_systems/show'
  get 'organ_systems/create'
  get 'home/about' => 'home#about', as: 'about'
  get 'home/index' => 'home#index', as: 'home'
  root 'home#index'
  get 'organ_systems/female_index' => 'organ_systems#female_index' , as: 'female'
  get 'organ_systems/male_index' => 'organ_systems#male_index', as: 'male'

  get 'organ_systems/nasopharynx' => 'organ_systems#nasopharynx_trigger', as: 'nasopharynx'
  get 'organ_systems/respiratory' => 'organ_systems#respiratory_trigger', as: 'respiratory'
  get 'organ_systems/stomach' => 'organ_systems#stomach_trigger', as: 'stomach'
  get 'organ_systems/smallintestine' => 'organ_systems#smallintestine', as: 'smallintestine'
  get 'organ_systems/largeintestine' => 'organ_systems#largeintestine', as: 'largeintestine'
  get 'organ_systems/urinary' => 'organ_systems#urinary', as: 'urinary'
  get 'organ_systems/female_genitalia' => 'organ_systems#female_genitalia', as: 'female_genitalia'
  get 'organ_systems/male_genitalia' => 'organ_systems#male_genitalia', as: 'male_genitalia'
  get 'organ_systems/skin' => 'organ_systems#skin', as: 'skin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
