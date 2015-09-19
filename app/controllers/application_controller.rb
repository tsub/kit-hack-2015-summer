class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

  before_action :require_valid_token

  private

  def require_valid_token
    access_token = params[:access_token]

    if !User.login?(access_token)
      respond_to do |format|
        format.json { render nothing: true, status: :unauthorized }
      end
    end
  end

  def current_user
    token = ApiKey.find_by(access_token: params[:access_token])

    if token && !token.expired?
      @current_user = User.find(token.user_id)
    else
      false
    end
  end
end
