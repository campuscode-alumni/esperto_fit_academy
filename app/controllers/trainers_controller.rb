class TrainersController < ApplicationController 
before_action :authenticate_employee!, only: %i[ new create edit update show]
before_action :params_find, only: %i[ show edit update add_units]


  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(set_trainer)
    
    if @trainer.save
      flash[:message] = 'Professor cadastrado com sucesso' 
      if !current_employee.admin
        @gym = Gym.where()
        
        @gym_trainer = GymTrainer.create!(trainer: @trainer, gym: current_employee.gym)
        
      end
      redirect_to @trainer
    else
      flash.now[:message] = @trainer.errors.full_messages.first
      render :new
    end
    
    
  end


  def show
    
    
  end

  def edit
    
  end

  def update
    if @trainer.update(set_trainer)
      flash[:message] = "Alterações realizadas com sucesso"
      redirect_to @trainer
    else
      flash.now[:message] = @trainer.errors.full_messages
      render :edit
    end
  end

  def management
    @trainers = Trainer.all
  end

  def add_units
    @gyms = Gym.all
    @gym_trainer = GymTrainer.new()
    
  end



  private 

  def set_trainer
    params.require(:trainer).permit(:name ,:cpf, :email, :status)
  end

  def params_find
    @trainer = Trainer.find(params[:id])
  end
end