class Topic < ApplicationRecord
  include Followable
  has_many :question_topics
  has_many :questions, through: :question_topics

  validates_uniqueness_of :content

  class << self
    def setup_topics(current_user, topics, question)
      topics = topics.split(",")
      topics.each do |topic|
        topic = current_user.topics.find_or_create_by(content: topic)
        question_topic = QuestionTopic.create(question_id: question.id, topic_id: topic.id)
      end
    end
  end

  
end
