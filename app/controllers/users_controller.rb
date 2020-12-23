class UsersController < ApplicationController
    def create
        user = User.create(name: params[:name], username: params[:username], password: params[:password],
            password_confirmation: params[:password_confirmation]) # should find out how to use set_params
        if user.valid?
            token = encode_token({ user_id: user.id })
            render json: { user: UserSerializer.new(user), jwt: token }
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def update
        user = User.find(params[:id])
        user.update(set_params)
        render json: user.to_json(except: [:created_at, :updated_at])
    end

    private

    def set_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end
end
