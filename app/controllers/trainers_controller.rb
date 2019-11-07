class TrainersController < ApplicationController 
before_action :authenticate_employee!, only: %i[ new create edit update show]
before_action :params_find, only: %i[ show edit update add_units]
before_action :authorize_admin, only: [:add_units]


  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(set_trainer)
    
    if @trainer.save
      logger.warn("#{@trainer} created")
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
      logger.warn("#{@trainer} updated")
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

  def authorize_admin
    redirect_to root_path unless current_employee.admin
  end
end