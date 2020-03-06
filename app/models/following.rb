class Following < ApplicationRecord
  belongs_to :followable, :polymorphic => true

  validate :same_user_cant_follow_his_own_items
  validate :already_following
  
  private 
  
  def already_following
    # case followable_type
    # when 'User'
      followings = Following.exists?(followable_id: followable_id, followed_id: followed_id, followable_type: followable_type)
      self.errors[:base] <<  'Already Following' if followings
    # when 'Topic'
      # followings = Follwing.exists?(follower_id: follower_id, followed_id: followed_id)
      # self.errors[:base] <<  'Already Following' if followings
    # end
  end

  def same_user_cant_follow_his_own_items
    case followable_type
    when 'User'
      self.errors[:base] <<  'User can not follow him self' if followed_id.eql?(followable_id) 
    when 'Topic'
      self.errors[:base] <<  'User can not follow his own topic' if followed_id.eql?(follower_id) 
    end
  end
end
