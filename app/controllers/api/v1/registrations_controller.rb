# frozen_string_literal: true

module API
  module V1
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      include API::Concerns::ActAsAPIRequest
      protect_from_forgery with: :null_session

      before_action :configure_sign_up_params, only: [:create]
      before_action :configure_account_update_params, only: [:update]

      private
      # If you have extra params to permit, append them to the sanitizer.
      def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
      end

      # If you have extra params to permit, append them to the sanitizer.
      def configure_account_update_params
        devise_parameter_sanitizer.permit(:account_update, keys: [:role])
      end
      
      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation,
                                     :username, :first_name, :last_name, :role)
      end

      def render_create_success
        render json: {
          data: resource_data(resource_json: @resource.token_validation_response)
        }
      end

      def render_error(status, message, _data = nil)
        render json: { errors: Array.wrap(message:) }, status:
      end
    end
  end
end
