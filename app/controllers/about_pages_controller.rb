class AboutPagesController < ApplicationController
  # before_action :authenticate_admin!, except: [:show]

  def show
    @about_page = AboutPage.first
  end

  def edit
    @about_page = AboutPage.first
  end

  def update
    @about_page = AboutPage.first
    if @about_page.update(about_page_params)
      redirect_to about_page_path, notice: "About page was successfully updated."
    else
      render :edit
    end
  end

  private

  def about_page_params
    params.require(:about_page).permit(:title, :content)
  end
end
