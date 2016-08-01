class VenuesController < ApplicationController
# skip_before_action :verify_authenticity_token, only: [:create]
  def index
    @venues = Venue.all
    @favorites = current_user.favorites
  end

  def new
    @venue = Venue.new
    @game = Game.new
    @games = Game.all[0..4]
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      if params[:venue][:games]
        @venue.games << Game.find(params[:venue][:games])
      end
      new_game_array = params[:venue][:game].split(',')
      new_game_array = new_game_array.map(&:lstrip)
      if new_game_array.length > 0
        new_game_array.each do |game|
          game_obj = Game.find_or_create_by(name: game)
          @venue.games << game_obj
        end
      end
      redirect_to venues_path
    else
      @games = Game.all
      @errors = @venue.errors.full_messages
      render 'new'
    end
  end

  def update
    if request.xhr?
    venue = Venue.find_by(id: params[:id])
    @current_rating = venue.avg_rating
      render partial: '/venues/venue_rating', locals: { current_rating: @current_rating }
    end
  end

  def show
    @venue = Venue.find_by(id: params[:id])
    @review = Review.new
    @vibes = Vibe.all
    @current_rating = @venue.avg_rating
    render 'show'
  end

  def search
    @query ="%#{params[:query]}%"
    @favorites = current_user.favorites
    @venues = Venue.where("name ilike ? or address ilike ? or description ilike ?", @query, @query, @query)
    render 'index'
  end

private

  def venue_params
    params.require(:venue).permit(:name, :address, :description, :place, :other, :games)
  end

end