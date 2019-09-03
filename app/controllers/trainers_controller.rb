class TrainersController < ApplicationController 
  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(set_trainer)
    if @trainer.save
      flash[:message] = 'Professor cadastrado com sucesso'
      redirect_to @trainer
    else
      flash.now[:message] = @treiner.errors.full_messages
      render :new
    end
    
  end


  def show
    @trainer = Trainer.find(params[:id])

  end

  private 

  def set_trainer
    params.require(:trainer).permit(:name ,:cpf)
  end
end