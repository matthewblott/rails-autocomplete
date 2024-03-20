class MoviesController < ApplicationController
  def search
    if params[:q].present?
      @movies = Movie.name_like(params[:q])
    else
      @movies = []
    end

    respond_to do |format|
      format.turbo_stream do
        render(
          turbo_stream: turbo_stream.update(
            "movie_search_results",
            partial: "movies/search_results",
            locals: {movies: @movies}
          )
        )
      end
    end
  end
end
