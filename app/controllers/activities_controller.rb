class ActivitiesController < ApplicationController
  before_action :authenticate_employee!, only: %i[new create]
  before_action :find_all, only: %i[create]

  def show
    @activity = Activity.find(params[:id])
  end
  def new
    @activity = Activity.new
  end
  
  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to @activity
      flash[:notice] = 'Aula cadastrada com sucesso!'
    else
      render :new
      find_all
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :status, :price, :duration, :capacity,
                   :difficulty, :equipments, :rules, :gym_id, :trainer_id)
  end

  def find_all
    @gym = Gym.all
    @trainer = Trainer.all
  end
end