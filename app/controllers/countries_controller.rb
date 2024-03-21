class CountriesController < ApplicationController
  def index
  end

  def search
    q = params[:q]
    countries = if q.present?
      Country.name_like(q)
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
            locals: {items: items, q: q}
          )
        )
      end
    end
  end
end
