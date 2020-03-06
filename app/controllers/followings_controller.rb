class FollowingsController < ApplicationController
  before_action :authenticate_user!


  def follow_user
    user = User.find_by_id(params[:id])
    @followings = current_user.followeds.new(followable_type: 'User', followable_id: user.id, follower_id: user.id)
  
    respond_to do |format|
      if @followings.save
        format.html { redirect_to root_path, notice: 'Followed Successfully' }
      else
        format.html { redirect_to root_path, notice: "Could not Follow : Reasons #{@followings.errors.full_messages.join(', ')}" }
      end
    end
  end

  def follow_topic
    topic = Topic.find_by_id(params[:id])
    @followings = current_user.followeds.new(followable_type: 'Topic', followable_id: topic.id, follower_id: topic.user_id)
    respond_to do |format|
      if @followings.save
        format.html { redirect_to root_path, notice: 'Followed Successfully' }
      else
        format.html { redirect_to root_path, notice: "Could not Follow : Reasons #{@followings.errors.full_messages.join(', ')}" }
      end
    end
  end
end
