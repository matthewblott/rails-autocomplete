class MoviesController < ApplicationController
  def search
    q = params[:q]
    movies = if q.present?
      Movie.name_like(q)
    else
      []
    end

    items = {}
    movies.map { |movie| items[movie.id] = movie.name }

    respond_to do |format|
      format.turbo_stream do
        render(
          turbo_stream: turbo_stream.update(
            "movie_search_results",
            partial: "search_results",
            locals: {items: items, q: q}
          )
        )
      end
    end
  end
end
