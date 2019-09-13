class GymsController < ApplicationController
  before_action :authenticate_employee!
  before_action :authorize_admin, only: [:destroy]
  before_action :find_gym, only: %i[show edit update destroy]

  def index
    @gyms = Gym.all
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

  def edit; end

  def update
    if @gym.update(gym_params)
      flash[:notice] = 'Academia atualizada com sucesso!'
      redirect_to @gym
    else
      flash.now[:notice] = 'Aconteceu um erro'
      render :edit
    end
  end

  def destroy
    @gym.destroy
    flash[:notice] = 'Academia removida com sucesso!'
    redirect_to root_path
  end

  private

  def gym_params
    params.require(:gym).permit(:name, :cod, :address, :open_hour, :close_hour, :working_days, gallery: [])
  end

  def find_gym
    @gym = Gym.find(params[:id])
  end

  def authorize_admin
    redirect_to root_path unless current_employee.admin
  end
end
