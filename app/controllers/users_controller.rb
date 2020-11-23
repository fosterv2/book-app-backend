class UsersController < ApplicationController
    # def show
    # need to do auth
    # end

    def create
        user = User.create(set_params)
        render json: user.to_json(except: [:created_at, :updated_at])
    end

    def update
        user = User.find(params[:id])
        user.update(set_params)
        render json: user.to_json(except: [:created_at, :updated_at])
    end

    # def destroy
    #     user = User.find(params[:id])
    #     user.destroy
    # end

    private

    def set_params
        params.require(:user).permit(:name, :username, :password)
    end
end
