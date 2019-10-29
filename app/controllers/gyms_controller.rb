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
      redirect_to @gym, notice: t(:success_create, 
                                  scope: [:notice], models: Gym.model_name.human)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @gym.update(gym_params)
      redirect_to @gym, notice: t(:success_update, 
                                  scope: [:notice], models: Gym.model_name.human)
    else
      flash.now[:alert] = t(:fail_update, 
                            scope: [:alert], models: Gym.model_name.human)
      render :edit
    end
  end

  def destroy
    @gym.destroy
    redirect_to root_path, notice: t(:success_destroy, 
                                     scope: [:notice], models: Gym.model_name.human)
  end

  private

  def gym_params
    params.require(:gym).permit(:name, :cod, :address, :open_hour, :close_hour, :working_days, gallery: [])
  end

  def find_gym
    @gym ||= Gym.find(params[:id])
  end

  def authorize_employee
    redirect_to root_path unless current_employee.gym?(@gym) || current_employee.admin?
  end
end
