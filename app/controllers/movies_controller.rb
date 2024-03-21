class MoviesController < ApplicationController
  def search
    movies = if params[:q].present?
      Movie.name_like(params[:q])
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
            locals: {items:}
          )
        )
      end
    end
  end
end
