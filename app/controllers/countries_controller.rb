class CountriesController < ApplicationController
  def search
    if params[:q].present?
      @countries = Country.name_like(params[:q])
    else
      @countries = []
    end

    respond_to do |format|
      format.turbo_stream do
        render(
          turbo_stream: turbo_stream.update(
            "search_results",
            partial: "countries/search_results",
            locals: {countries: @countries}
          )
        )
      end
    end
  end
end
