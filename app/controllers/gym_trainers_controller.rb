class GymTrainersController < ApplicationController 

  def create 
    @gym_trainer = GymTrainer.new(gym_id: params[:gym_id], trainer_id: params[:trainer_id])
    @gym_trainer.save
    redirect_to_trainer
  end

  def destroy
    @gym_trainer = GymTrainer.find(params[:id])
    @gym_trainer.destroy
    redirect_to_trainer
  end
  
  private

  def redirect_to_trainer
    redirect_to add_units_trainer_path(@gym_trainer.trainer_id)
  end
end