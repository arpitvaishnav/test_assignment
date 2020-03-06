class Following < ApplicationRecord
  belongs_to :followable, :polymorphic => true

  validate :same_user_cant_follow_his_own_items
  private def same_user_cant_follow_his_own_items
    case followable_type
    when 'User'
      self.errors[:base] <<  'User can not follow him self' if followed_id.eql?(followable_id) 
    when 'Topic'
      self.errors[:base] <<  'User can not follow his own topic' if followed_id.eql?(follower_id) 
    end
  end
end
