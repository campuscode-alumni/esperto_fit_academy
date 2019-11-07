class ActivitiesController < ApplicationController
  before_action :authenticate_employee!, only: %i[index new create edit update]
  before_action :find_activity_id, only: %i[show edit update]

  def index
    @activities = Activity.all
  end

  def show ; end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to @activity
      flash[:notice] = 'Aula cadastrada com sucesso!'
      logger.warn("#{@activity} created ")
    else
      render :new
      find_all
    end
  end

  def edit ; end

  def update
    if @activity.update(activity_params)
      redirect_to @activity, notice: 'Aula atualizada com sucesso!'
      logger.warn("#{@activity} updated ")
    else
      render :edit
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

  def find_activity_id
    @activity = Activity.find(params[:id])
  end
end