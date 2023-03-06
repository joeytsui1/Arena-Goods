class Api::CartsController < ApplicationController
    def index
        @carts = Cart.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        @cart = Cart.where(user_id: @user[:id])
        render :show
    end

    def create
    @cart = Cart.find_by(user_id: params[:user_id], product_id: params[:product_id], size: params[:size])
        if @cart
            @cart.quantity += 1
            @cart.save!
        else
            @cart = Cart.new(carts_params)
            unless @cart.save
                render json: { errors: ["Invalid login credentials, please correct your email address/password and submit again"] }, status: :unprocessable_entity
            return
            end
        end

        @user = User.find(params[:user_id])
        @cart = Cart.where(user_id: @user[:id])
        render :show
    end

    def update
        @cart = Cart.find_by(user_id: params[:user_id], product_id: params[:product_id])
        if @cart
            @cart.quantity = params[:quantity]
            @cart.size = params[:size]
            @cart.save!
        end
        @user = User.find(params[:user_id])
        @cart = Cart.where(user_id: @user[:id])
        render :show
    end

    def destroy
        @cart = Cart.find_by(id: params[:id])
        @cart.destroy
    end

    private

    def carts_params
        params.require(:cart).permit(:user_id, :product_id, :quantity, :size)
    end
end
