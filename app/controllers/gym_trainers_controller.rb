class GymTrainersController < ApplicationController 
  

  def create 
   

    @trainer = Trainer.find(params[:trainer_id]) 
    #@gym_trainer = GymTrainer.create(params.require(:gym_trainer).permit(:trainer_id, :gym_id))
 
    
    

    #@trainer = @gym_trainer.trainer_id



    p = params.require(:trainer).permit(gym_ids: [])

    p[:gym_ids].each { |obj| GymTrainer.create(gym_id: obj, trainer:@trainer)}
    
    redirect_to @trainer
  end
end