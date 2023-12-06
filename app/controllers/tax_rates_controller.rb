class TaxRatesController < ApplicationController
  def index
    @provinces = Province.all
  end

  def update
    tax_rates_params = params.require(:tax_rates).permit(provinces_attributes: %i[id gst hst
                                                                                  pst])

    tax_rates_params[:provinces_attributes].each do |province_params|
      province = Province.find(province_params[:id])
      province.update(province_params.except(:id))
    end

    redirect_to tax_rates_path, notice: "Tax rates updated successfully."
  end
end
