class DirectorsController < ApplicationController

  def index
    @directors = Director.all
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(params.require(:director).permit(:name, :nationality, :birth_date, :genre_id))
    return redirect_to director_path(@director.id) if @director.save
  end

  def show
    @director = Director.find(params[:id])
    @movies_of_director = Movie.where(director_id: params[:id])
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])
    if @director.update(name: params[:director][:name],
      nationality: params[:director][:nationality],
      birth_date: params[:director][:birth_date],
      genre_id: params[:director][:genre_id])
      return redirect_to director_path(@director.id)
    end
  end
end
