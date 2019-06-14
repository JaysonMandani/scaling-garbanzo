Rails.application.routes.draw do
  root 'candidates#index'

  resources :candidates do
    collection do
      post :invite
    end
  end
end
