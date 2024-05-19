# frozen_string_literal: true

module API
  module V1
    class SessionsController < DeviseTokenAuth::SessionsController
      include API::Concerns::ActAsAPIRequest
      protect_from_forgery with: :null_session

      private

      def resource_params
        params.require(:user).permit(:email, :password)
      end

      def render_create_success
        render json: {
          data: resource_data(resource_json: @resource.token_validation_response)
        }
      end

      protected

      def resource_data(opts = {})
        response_data = super
        response_data[:role] = @resource.role
        response_data
      end

      def render_error(status, message, _data = nil)
        render json: { errors: Array.wrap(message:) }, status:
      end
    end
  end
end
