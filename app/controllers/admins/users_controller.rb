class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@users = User.with_deleted.page(params[:page]).per(15)
  end

  def show
  	@user = User.find(params[:id])
  end

  def update
  	user = User.only_deleted.find(params[:id])
  	user.restore
  	redirect_to admins_users_path
  end

  def destroy
  	user = User.find(params[:id])
  	user.destroy
  	redirect_to admins_users_path
  end
end
