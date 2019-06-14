Rails.application.routes.draw do
  resources :candidates do
    collection do
      post :invite
    end
  end
end
