class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

  before_action :require_valid_token

  private

  def require_valid_token
    access_token = request.headers[:HTTP_ACCESS_TOKEN]

    if !User.login?(access_token)
      respond_to do |format|
        format.json { render nothing: true, status: :unauthorized }
      end
    end
  end
end
