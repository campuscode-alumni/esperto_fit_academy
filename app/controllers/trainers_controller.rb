class TrainersController < ApplicationController 

before_action :params_find, only: %i[ show edit update]

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(set_trainer)
    if @trainer.save
      flash[:message] = 'Professor cadastrado com sucesso'
      redirect_to @trainer
    else
      flash.now[:message] = @trainer.errors.full_messages
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

  private 

  def set_trainer
    params.require(:trainer).permit(:name ,:cpf, :status)
  end

  def params_find
    @trainer = Trainer.find(params[:id])
  end
end