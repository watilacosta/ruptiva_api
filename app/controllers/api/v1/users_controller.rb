module Api
  module V1
    class UsersController < ApiController
      before_action :set_user, only: %i[show update destroy]

      def show
        render json: @user, status: :ok
      end

      def index
        authorize User
        users = User.all

        render json: users, status: :ok
      end

      def create
        user = User.create(user_params)
        authorize user

        render json: user, status: :created
      end

      def update
        @user.update(user_params)

        render json: @user, status: :ok
      end

      def destroy
        @user.destroy

        render json: @user, status: :no_content
      end

      private

      def user_params
        params.require(:user).permit(%i[first_name last_name email password role])
      end

      def set_user
        @user = User.find(params[:id])
        authorize @user
      end
    end
  end
end
