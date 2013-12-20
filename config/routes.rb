Kicksplorer::Application.routes.draw do

  root 'projects#index'

  patch 'search', to: 'projects#search', to: [:get, :post]
  get  'kicksplore', to: 'projects#kicksplore', as: 'kicksplore'


end
