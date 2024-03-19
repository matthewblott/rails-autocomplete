class MoviesController < ApplicationController
  def search
    if params[:q].present?
      @movies = Movie.filter_by_title(params[:q])
    else
      @movies = []
    end

    respond_to do |format|
      format.turbo_stream do
        render(
          turbo_stream: turbo_stream.update(
            "search_results",
            partial: "movies/search_results",
            locals: {movies: @movies}
          )
        )
      end
    end
  end
end
