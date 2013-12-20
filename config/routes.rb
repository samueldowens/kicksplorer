Kicksplorer::Application.routes.draw do

  root 'projects#index'

  match 'kicksplore', to: 'projects#kicksplore', via: :all


end
