Rails.application.routes.draw do
  get 'follow_user/:id'=> 'followings#follow_user', as: :follow_user
  get 'follow_topic/:id'=> 'followings#follow_topic', as: :follow_topic
  root to: 'home#index'

  get 'home/index'
  get 'home/questions' => 'home#questions', as: :home_questions
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
