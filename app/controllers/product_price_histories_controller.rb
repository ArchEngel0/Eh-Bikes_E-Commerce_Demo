class ProductPriceHistoriesController < ApplicationController
  before_action :set_product_price_history, only: %i[ show edit update destroy ]

  # GET /product_price_histories or /product_price_histories.json
  def index
    @product_price_histories = ProductPriceHistory.all
  end

  # GET /product_price_histories/1 or /product_price_histories/1.json
  def show
  end

  # GET /product_price_histories/new
  def new
    @product_price_history = ProductPriceHistory.new
  end

  # GET /product_price_histories/1/edit
  def edit
  end

  # POST /product_price_histories or /product_price_histories.json
  def create
    @product_price_history = ProductPriceHistory.new(product_price_history_params)

    respond_to do |format|
      if @product_price_history.save
        format.html { redirect_to product_price_history_url(@product_price_history), notice: "Product price history was successfully created." }
        format.json { render :show, status: :created, location: @product_price_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_price_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_price_histories/1 or /product_price_histories/1.json
  def update
    respond_to do |format|
      if @product_price_history.update(product_price_history_params)
        format.html { redirect_to product_price_history_url(@product_price_history), notice: "Product price history was successfully updated." }
        format.json { render :show, status: :ok, location: @product_price_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_price_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_price_histories/1 or /product_price_histories/1.json
  def destroy
    @product_price_history.destroy!

    respond_to do |format|
      format.html { redirect_to product_price_histories_url, notice: "Product price history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_price_history
      @product_price_history = ProductPriceHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_price_history_params
      params.require(:product_price_history).permit(:product_id, :price, :effective_date)
    end
end
