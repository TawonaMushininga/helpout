# frozen_string_literal: true

module API
  module V1
    class UsersController < API::V1::APIController

      before_action :set_user, only: %i[show update]
      def index
        authorize current_user
        @users = User.all
        render json: @users
      end

      def show
        authorize current_user
        render json: @user
      end

      def update
        authorize current_user
        @user.update!(update_user_params)
        render :show
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def update_user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :role)
      end
    end
  end
end
