# frozen_string_literal: true

module API
  module V1
    class UsersController < API::V1::APIController

      def index
        authorize current_user
        @users = User.all
      end

      def show
        authorize current_user
      end

      def update
        authorize current_user
        current_user.update!(update_user_params)
        render :show
      end

      private

      def update_user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :role)
      end
    end
  end
end
