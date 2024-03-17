class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show]

  def index
    @movies = Movie.all
  end

  def search
    if params[:title_search].present?
      @movies = Movie.filter_by_title(params[:title_search])
    else
      @movies = []
    end

    respond_to do |format|
      format.turbo_stream do
        # render turbo_stream: turbo_stream.update("search_results", Time.zone.now)
        # render turbo_stream: turbo_stream.update("search_results", @movies.count)
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

  def show
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title)
  end
end
