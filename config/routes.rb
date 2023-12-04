Rails.application.routes.draw do
  resources :loans do
    member do
      post 'return_loan'
      get 'confirm_return'
      post 'complete_return_loan'
    end
  end

  resources :students
  resources :books
  get 'welcome/index'
  root to: 'welcome#index'
end
