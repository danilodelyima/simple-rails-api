class FriendshipsController < ApplicationController
  before_action :set_user
  def create
    @user.friendship!(params[:friend_id])
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def friendship_params
      params.permit(:user_id, :friend_id)
    end
end
