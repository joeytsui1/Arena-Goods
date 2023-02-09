class Api::ProductsController < ApplicationController
    # def index
    #     @products = Product.all
    #     render 
    # end

    def show
        @product = Product.find(params[:id])
        render :show
    end
end