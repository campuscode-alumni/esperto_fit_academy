class ClientsController < ApplicationController
  before_action :authenticate_employee!
  before_action :find_all, only: %i[create update]
  before_action :find_client_by_id, only: %i[show edit update verify_payments banishe_client suspend_client inactive_client ]
  rescue_from ActiveRecord::RecordNotFound, with: :client_not_found
  
  def index
    @clients = Client.all 
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to @client, notice: t(:success_create, 
      scope: [:notice], models: Client.model_name.human)
    else
      find_all
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: t(:success_update, 
      scope: [:notice])
    else
      find_all
      render :edit
    end
  end

  def banishe_client
    BanisheService.new(@client).call
    redirect_to @client, notice: t(:client_banished, 
    scope: [:notice])
  end

  def suspend_client
    @client.suspended!
    redirect_to @client, notice: t(:client_suspend, 
    scope: [:notice])
  end
  
  def inactive_client
    BanisheService.new(@client).call
    end
    redirect_to @client
  end

  def verify_payments
    @client.indebted! if @client.last_payment_status == 'unpaid' && @client.active?
    @client.active! if @client.last_payment_status == 'paid' && @client.indebted?

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

  def find_client_by_id
    @client ||= Client.find(params[:id])
  end

  def client_not_found
    redirect_to clients_path, alert: t(:not_found, 
    scope: [:alert, :client])
  end
end