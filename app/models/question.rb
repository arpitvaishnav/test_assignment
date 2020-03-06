class Question < ApplicationRecord

  has_rich_text :content

  belongs_to :user
  has_many :answers
  has_many :question_topics
  has_many :topics, through: :question_topics
end
