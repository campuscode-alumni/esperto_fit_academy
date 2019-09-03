class GymsController < ApplicationController
  before_action :find_gym, only: %i[show]

  def index
  end

  def show; end

  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(gym_params)
    if @gym.save
      redirect_to @gym
      flash[:notice] = 'Academia cadastrada'
    else
      render :new
    end
  end

  private

  def gym_params
    params.require(:gym).permit(:name, :cod, :adress, :open_hour, :close_hour, :working_days)
  end

  def find_gym
    @gym = Gym.find(params[:id])
  end
end