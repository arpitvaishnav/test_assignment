class Answer < ApplicationRecord

  belongs_to :user
  belongs_to :question

  validates :content , :question_id, presence: true
  # validates :user_id, uniqueness: {scope: :question_id}
  validates_uniqueness_of :user_id, scope: :question_id, message: "You can answer only one time to one question"

  validate :current_user_cant_answer
  private def current_user_cant_answer
    if (question.user_id == user_id)
      self.errors[:base] << "You can not answer your own question"
    end
  end


end
