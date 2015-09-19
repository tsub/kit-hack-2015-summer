class UserSessionsController < ApplicationController
  skip_before_filter :require_valid_token, only: :create

  def new
    @user = User.new
  end

  def create
    email = params[:my_number]
    password = params[:my_number]

    if @user = login(email, password)
      api_key = @user.activate
      @access_token = api_key.access_token

      respond_to do |format|
        format.json { render json: { access_token: @access_token, status: :ok } }
      end
    else
      respond_to do |format|
        format.json { render nothing: true, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    access_token = params[:access_token]
    api_key = ApiKey.find_by_access_token(access_token)
    if api_key
      user = User.find(api_key.user_id)
      user.inactivate
      respond_to do |format|
        format.json { render nothing: true, status: :ok }
      end
    end
  end

  private

  def login_user
    params[:user]
  end
end
