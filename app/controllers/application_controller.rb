class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :validate_admin

  private
  def validate_admin
    unless current_user.admin.present?
      render status: :unauthorized
    end
  end
end
