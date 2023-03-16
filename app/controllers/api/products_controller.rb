class Api::ProductsController < ApplicationController
    def index
        search = params[:search]
        if search == ''
            @products = Product.all
            render :index
        else
            @products = Product.where(brand: "NIKE")
            render :index
        end

    end

    def show
        @product = Product.find(params[:id])
        render :show
    end
end