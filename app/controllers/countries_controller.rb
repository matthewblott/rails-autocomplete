class CountriesController < ApplicationController
  def search
    countries = if params[:q].present?
      Country.name_like(params[:q])
    else
      []
    end

    items = {}
    countries.map { |country| items[country.id] = country.name }

    respond_to do |format|
      format.turbo_stream do
        render(
          turbo_stream: turbo_stream.update(
            "country_search_results",
            partial: "search_results",
            locals: {items:}
          )
        )
      end
    end
  end
end
