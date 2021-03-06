# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  before_action :just_json_request

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound do |msg|
    render(json: { message: msg }, status: :not_found)
  end

  rescue_from ActionController::ParameterMissing do |exception|
    render(json: { message: exception.param }, status: :bad_request)
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def pundit_user
    current_api_v1_user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer
      .permit(:sign_up, keys: %i[first_name last_name role password
                                  password_confirmation])

    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
  end

  private

  def just_json_request
    return if request.headers["Accept"] =~ /vnd\.api\+json/

    render nothing: true, status: 406
  end

  def user_not_authorized
    render json: { msg: "Usuário não autorizado!" }, status: :unauthorized
  end
end