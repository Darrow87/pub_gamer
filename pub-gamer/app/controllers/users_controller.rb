class UsersController < ApplicationController

  def new
    if request.xhr?
      # binding.pry
      @user = User.new
      render partial: 'registration_form'
    end
  end

  def update
    binding.pry
    @venue = Venue.find_by(id: params[:venue])
    @user = current_user
    @user.favorites << @venue
    if request.xhr?
      render partial: 'users/favorited'
    else
      redirect_to venue_path(@venue)
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @favorites = @user.favorites
    @events_created = Event.find_by(user_id: @user.id)
    @events_attending = @user.events
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  private

  def user_params
      params.require(:user).permit(:user_name,:email,:password, :venue)
  end
end