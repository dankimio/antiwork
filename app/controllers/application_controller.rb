class ApplicationController < ActionController::Base
  include Passwordless::ControllerHelpers

  helper_method :current_company

  private

  def current_company
    @current_company ||= authenticate_by_session(company)
  end

  def require_company!
    return if current_company

    redirect_to root_path, flash: { error: 'Please log in first.' }
  end
end
