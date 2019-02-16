class TaxesController < ApplicationController
  before_action :set_income_tax, only: [:income_tax]

  # GET /income_tax/1.json
  def income_tax
    respond_to do |format|
        format.json {
            respons_data = {
                "year" => params[:y],
                "taxableIncome_amount" => params[:c],
                "tax_income" => 12345678,
              }
            render :json => {staus: 200,data: respons_data}
        }
    end
  end

  private
    def set_income_tax
#        params.require(:calc).permit(:c)
        @taxableIncome_amount = IncomeTax.new
        @taxableIncome_amount.tax_income = params[:c]
    end
end
