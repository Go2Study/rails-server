class UsersController < ApplicationController

  before_action :load_user,
    only: [:show, :update]

  ### ACTIONS ###

  def index
    @users = User.all
    render json: @users, except: [:id, :created_at, :updated_at]
  end

  def create
    @user = User.new user_create_params

    if @user.save
      render json: @user
    else
      render text: "fail"
    end
  end

  def show
    render json: @user
  end

  def update
    if @user.update_attributes user_update_params
      render json: @user
    else
      render text: "fail"
    end
  end

  ### PRIVATE ###

  private

  def user_create_params
    params.permit(:pcn, :first_name, :last_name, :display_name, :mail, :photo, :ip_address)
  end

  def user_update_params
    params.permit(:display_name, :mail, :photo, :ip_address)
  end

  def load_user
    begin
      @user = User.find params[:id]
    rescue ActiveRecord::RecordNotFound
      error = {
        error: {
          code: 404,
          message: 'Not Found'
        }
      }

      render json: error.to_json, status: 404
    end
  end

end
