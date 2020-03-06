Rails.application.routes.draw do
  root to: 'home#index'

  get 'home/index'
  get 'question/:question_id' => 'home#question', as: :home_question

  resources :topics
  resources :answers
  resources :questions do 
    member do 
      resources :answers , as: :question_answers
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
