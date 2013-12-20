Kicksplorer::Application.routes.draw do

  root 'projects#index'

  post 'search', to: 'projects#search'
  get  'kicksplore', to: 'projects#kicksplore', as: 'kicksplore'


end
