class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    @user.follow!(params[:brand_id])
  end

  def destroy
    @user.unfollow!(params[:brand_id])
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def relatioship_params
      params.permit(:user_id, :brand_id)
    end
end
