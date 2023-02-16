class Api::FavoritesController < ApplicationController
    def index 
        @favorites = Favorite.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        @favorite = Favorite.where(user_id: @user[:id])
    end

    def create

        @favorite = Favorite.find_by(favorites_params)
        if !@favorite
            @favorite = Favorite.new(favorites_params)
            @favorite.save!
        end
        @user = User.find(params[:user_id])
        @favorite = Favorite.where(user_id: @user[:id])
        render :show
    end

    def destroy
        @favorite = Favorite.find_by(product_id: params[:id])
        @favorite.destroy
    end

    private
    def favorites_params
        params.require(:favorite).permit(:user_id, :product_id)
    end
end