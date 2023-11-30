class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products or /products.json
  def index
    @products = Product.page(params[:page]).per(5)

    apply_category_filter if params[:category].present? && params[:category] != ""
    apply_search_filter if params[:search].present?
  end

  # GET /products/1 or /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    set_product_category
    respond_to do |format|
      if @product.save && @product_category.save
        format_on_successful_save(format)
      else
        format_on_failed_save(format)
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product = Product.find(params[:id])
    set_product_category
    respond_to do |format|
      if @product.update(product_params) && @product_category.save
        format_on_successful_save(format)
      else
        format_on_failed_save(format)
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def apply_category_filter
    category = Category.find(params[:category])
    @products = @products.joins(:categories).where(categories: { id: category.id })
  end

  def apply_search_filter
    search_term = params[:search].downcase
    @products = @products.where("products.name LIKE ? OR products.description LIKE ?",
                                "%#{search_term}%", "%#{search_term}%")
  end

  def set_product_category
    @product_category = @product.product_categories.first_or_initialize
    @product_category.category_id = params[:product][:category_id]
  end

  def format_on_successful_save(format)
    format.html do
      redirect_to product_url(@product), notice: "Product was successfully created."
    end
    format.json { render :show, status: :created, location: @product }
  end

  def format_on_failed_save
    format.html { render :new, status: :unprocessable_entity }
    format.json { render json: @product.errors, status: :unprocessable_entity }
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :image, :sale, :category_id)
  end
end
