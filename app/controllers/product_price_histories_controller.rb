class ProductPriceHistoriesController < ApplicationController
  before_action :set_product_price_history, only: %i[show edit update destroy]

  # GET /product_price_histories or /product_price_histories.json
  def index
    @product_price_histories = ProductPriceHistory.all
  end

  # GET /product_price_histories/1 or /product_price_histories/1.json
  def show; end

  # GET /product_price_histories/new
  def new
    @product_price_history = ProductPriceHistory.new
  end

  # GET /product_price_histories/1/edit
  def edit; end

  # POST /product_price_histories or /product_price_histories.json
  def create
    @product_price_history = ProductPriceHistory.new(product_price_history_params)

    respond_to do |format|
      if save_product_price_history
        format.html { redirect_to_product_price_history }
        format.json { render_product_price_history(status: :created) }
      else
        format.html { render_new_product_price_history(status: :unprocessable_entity) }
        format.json { render_product_price_history_errors(status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /product_price_histories/1 or /product_price_histories/1.json
  def update
    respond_to do |format|
      if update_product_price_history
        format.html { redirect_to_product_price_history }
        format.json { render_product_price_history(status: :ok) }
      else
        format.html { render_edit_product_price_history(status: :unprocessable_entity) }
        format.json { render_product_price_history_errors(status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /product_price_histories/1 or /product_price_histories/1.json
  def destroy
    @product_price_history.destroy!

    respond_to do |format|
      format.html do
        redirect_to product_price_histories_url,
                    notice: "Product price history was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  def save_product_price_history
    @product_price_history.save
  end

  def redirect_to_product_price_history
    redirect_to product_price_history_url(@product_price_history),
                notice: "Product price history was successfully created."
  end

  def render_product_price_history(options)
    render :show, status: options[:status], location: @product_price_history
  end

  def render_new_product_price_history(options)
    render :new, status: options[:status]
  end

  def update_product_price_history
    @product_price_history.update(product_price_history_params)
  end

  def render_edit_product_price_history(options)
    render :edit, status: options[:status]
  end

  def render_product_price_history_errors(options)
    render json: @product_price_history.errors, status: options[:status]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_product_price_history
    @product_price_history = ProductPriceHistory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_price_history_params
    params.require(:product_price_history).permit(:product_id, :price, :effective_date)
  end
end
