class ProductsController < ApplicationController
  before_action :set_brand, only: [:index]
  before_action :set_product, only: [:show, :update, :destroy]

  # GET brands/1/products
  def index
    render json: @brand.products
  end

  # GET brands/1/products/1
  def show
    render json: @product
  end

  # POST brands/1/products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: brand_product_url(@product.brand_id, @product)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT brands/1/products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE brands/1/products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params[:brand_id])
    end

    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.permit(:name, :brand_id)
    end
end
