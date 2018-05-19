Rails.application.routes.draw do
  get 'home/about' => 'home#about', as: 'about'
  get 'home/index' => 'home#index', as: 'home'
  get 'home/index2' => 'home#index2', as: 'home2'
  root 'home#index'
  post '/search' => 'home#search'
  get 'floras/show/:id' => 'floras#show', as: 'floras_show_organism'

  resources :organ_systems, only: [:index, :show, :create] do
    collection do
      get :female_index, as: 'female'
      get :male_index, as: 'male'
    end
  end

  resources :organisms, only: [:index, :show] do
    get :search_show
  end

  resources :antibiotics
  resources :efficacies
# the floras partial is a page in the floras controller designed to organize all of the
# active record results for flora modals. Pending.
  # get 'floras_partial' => ''

end
