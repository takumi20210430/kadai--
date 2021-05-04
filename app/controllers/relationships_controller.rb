class RelationshipsController < ApplicationController

  def create
    follow = current_user.active_relationships.build(followed_id: params[:user_id])
    follow.save
    # Relationship.create(followed_id: params[:user_id], follower_id: current_user.id)
    redirect_back fallback_location: users_path
  end

  def destroy
    follow = current_user.active_relationships.find_by(followed_id: params[:user_id])
    follow.destroy
    #Relationship.find_by(follower_id: params[:user_id], followed_id: current_user.id).destroy
    redirect_back fallback_location: users_path
  end

  

end
