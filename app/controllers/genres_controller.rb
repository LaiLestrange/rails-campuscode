class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params.require(:genre).permit(:name))
    return redirect_to genre_path(@genre.id) if @genre.save
  end

  def show
    @genre = Genre.find(params[:id])
    @movies_of_genre = Movie.where(genre_id: params[:id])
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(name: params[:genre][:name])
      return redirect_to genre_path(@genre.id)
    end
  end

end
