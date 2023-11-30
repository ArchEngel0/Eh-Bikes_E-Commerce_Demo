class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show; end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories or /categories.json
  def create
    @category = build_category(category_params)

    if save_category(@category)
      redirect_to_category(@category, "Category was successfully created.")
    else
      render_new_category(@category)
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    if update_category(category_params)
      redirect_to_category(@category, "Category was successfully updated.")
    else
      render_edit_category(@category)
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy!

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def build_category(category_params)
    Category.new(category_params)
  end

  def save_category(category)
    category.save
  end

  def redirect_to_category(category, notice)
    redirect_to category_url(category), notice:
  end

  def render_new_category(_category)
    render :new, status: :unprocessable_entity
  end

  def update_category(category_params)
    @category.update(category_params)
  end

  def render_edit_category(_category)
    render :edit, status: :unprocessable_entity
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end
end
