class GymTrainersController < ApplicationController 

  def create 
    @gym_trainer = GymTrainer.new(gym_id: params[:gym_id], trainer_id: params[:trainer_id])
    @gym_trainer.save
    redirect_to add_units_trainer_path(params[:trainer_id])
  end

  def destroy
  
    @gym_trainer = GymTrainer.find(params[:id])
    @gym_trainer.destroy
  
    redirect_to add_units_trainer_path(@gym_trainer.trainer_id)
  end
  
end