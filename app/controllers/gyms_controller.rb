class GymsController < ApplicationController
  before_action :authenticate_employee!
  before_action :find_gym, only: %i[show edit update destroy]
  before_action :authorize_employee, only: [:update]
  before_action :authorize_admin, only: [:destroy]

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
      logger.warn("#{@gym} created")
      redirect_to @gym, notice: t(:successfully_creating, scope: [:notice, :gym])
    else
      render :new
    end
  end

  def edit; end

  def update
    if @gym.update(gym_params)
      logger.warn("#{@gym} updated")
      redirect_to @gym, notice: t(:successfully_editing, scope: [:notice, :gym])
    else
      flash.now[:notice] = t(:fails_editing, scope: [:notice, :gym])
      render :edit
    end
  end

  def destroy
    @gym.destroy
    logger.warn("#{@gym} deleted")
    redirect_to root_path, notice: t(:successfully_destroying, scope: [:notice, :gym])
  end

  private

  def gym_params
    params.require(:gym).permit(:name, :cod, :address, :open_hour, :close_hour, :working_days, gallery: [])
  end

  def find_gym
    @gym = Gym.find(params[:id])
  end

  def authorize_admin
    redirect_to root_path unless current_employee.admin?
  end

  def authorize_employee
    redirect_to root_path unless current_employee.gym?(@gym) || current_employee.admin?
  end
end
