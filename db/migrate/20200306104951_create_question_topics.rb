class CreateQuestionTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :question_topics do |t|
      t.bigint :question_id
      t.bigint :topic_id

      t.timestamps
    end
  end
end
