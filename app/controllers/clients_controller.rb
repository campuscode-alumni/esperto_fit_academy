class ClientsController < ApplicationController
  before_action :authenticate_employee!
  before_action :find_all, only: %i[create update]
  before_action :find_id, only: %i[show edit update verify_payments ]
  
  def index
    @clients = Client.all 
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      flash[:notice] = 'Matriculado com sucesso!'
      redirect_to @client
    else
      find_all
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Atualizado com sucesso!'
    else
      find_all
      render :edit
    end
  end

  def ban
    @client = Client.find(params[:id])
    @client.banished!
    redirect_to @client, notice: 'CPF banido com sucesso!'
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Não existe esse aluno!'
    redirect_to clients_path
  end

  def inactivate
    @client = Client.find(params[:id])
    if @client.active?
      @client.inactive!
      flash[:notice] = 'Cliente desvinculado com sucesso!'
    else 
      flash[:alert] = 'Cliente deve estar com status ativo para desvincular.'
    end
    redirect_to @client
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Não existe esse aluno!'
    redirect_to clients_path
  end

  def verify_payments
    @client.indebted! if @client.last_payment_status == 'indebted'
    redirect_to @client
  end

  private

  def client_params
    params.require(:client).permit(:name, :cpf, :email, :gym_id, :plan_id)
  end

  def find_all
    @gym = Gym.all
    @plan = Plan.all
  end

  def find_id
    @client = Client.find(params[:id])
  end
end