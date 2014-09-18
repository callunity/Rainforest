class ProductsController < ApplicationController
  before_action :ensure_logged_in, only: [:create, :edit, :update, :destroy]
  before_filter :product_find, only: [:show, :edit, :update, :destroy]

  def index
    @products = if params[:search] 
      Product.where('LOWER(name) LIKE LOWER(?)', "%#{params[:search]}%").page(params[:page])
    else
      Product.order('products.created_at DESC').page(params[:page])
    end

    respond_to :html, :js

    @product = Product.new

    @user = User.find_by(session[:user_id])
  end

  def show
    @reviews = Product.find(params[:id]).reviews

    if current_user
      @new_review = @product.reviews.build
    end

    respond_to do |format|
      format.html 
      format.js
    end    
  end

  def new
    @product = Product.new
  end

  def edit

  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

    if @product.save
      respond_to do |format|
        format.html {
          redirect_to product_path(@product)
        }
        format.js
      end
    else
      render :new, alert: "Something went wrong!"
    end


  end

  def update
    if @product.update_attributes(product_params)
      redirect_to product_path(@product)
    else 
      render :edit, alert: "Something went wrong!"
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path

  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end

  def product_find
    @product = Product.find(params[:id])
  end
end
