class ContactPagesController < ApplicationController
  before_action :set_contact_page, only: %i[show edit update destroy]

  # GET /contact_pages or /contact_pages.json
  def index
    @contact_pages = ContactPage.all
  end

  # GET /contact_pages/1 or /contact_pages/1.json
  def show; end

  # GET /contact_pages/new
  def new
    @contact_page = ContactPage.new
  end

  # GET /contact_pages/1/edit
  def edit; end

  # POST /contact_pages or /contact_pages.json
  def create
    @contact_page = build_contact_page(contact_page_params)

    if save_contact_page(@contact_page)
      redirect_to_contact_page(@contact_page, "Contact page was successfully created.")
    else
      render_new_contact_page(@contact_page)
    end
  end

  # PATCH/PUT /contact_pages/1 or /contact_pages/1.json
  def update
    if update_contact_page(contact_page_params)
      redirect_to_contact_page(@contact_page, "Contact page was successfully updated.")
    else
      render_edit_contact_page(@contact_page)
    end
  end

  # DELETE /contact_pages/1 or /contact_pages/1.json
  def destroy
    @contact_page.destroy!

    respond_to do |format|
      format.html do
        redirect_to contact_pages_url, notice: "Contact page was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  def build_contact_page(contact_page_params)
    ContactPage.new(contact_page_params)
  end

  def save_contact_page(contact_page)
    contact_page.save
  end

  def redirect_to_contact_page(contact_page, notice)
    redirect_to contact_page_url(contact_page), notice:
  end

  def render_new_contact_page(_contact_page)
    render :new, status: :unprocessable_entity
  end

  def update_contact_page(contact_page_params)
    @contact_page.update(contact_page_params)
  end

  def render_edit_contact_page(_contact_page)
    render :edit, status: :unprocessable_entity
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_contact_page
    @contact_page = ContactPage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_page_params
    params.require(:contact_page).permit(:title, :content)
  end
end
