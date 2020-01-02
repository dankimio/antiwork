class ApplicationController < ActionController::Base
  include Passwordless::ControllerHelpers

  helper_method :current_company

  private

  def current_company
    @current_company ||= authenticate_by_session(Company)
  end

  def require_company!
    return if current_company

    save_passwordless_redirect_location!(Company)
    redirect_to companies.sign_in_path, notice: t('views.flash.require_sign_in')
  end
end
