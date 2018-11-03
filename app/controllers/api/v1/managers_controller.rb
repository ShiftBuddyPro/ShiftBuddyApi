class Api::V1::ManagersController < ApplicationController
  before_action :set_manager, only: [:show, :update, :destroy]
  before_action :authenticate_request
  attr_reader :current_manager
  # GET /managers
  def index
    @managers = Manager.all
    render json: @managers
  end

  # GET /managers/1
  def show
    render json: @manager, serializer: ManagerSerializer
  end

  # POST /managers
  def create
    @manager = Manager.new(manager_params)

    if @manager.save
      render json: @manager, status: :created, location: api_v1_manager_url(@manager)
    else
      render json: @manager.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /managers/1
  def update
    if @manager.update(manager_params)
      render json: @manager
    else
      render json: @manager.errors, status: :unprocessable_entity
    end
  end

  # DELETE /managers/1
  def destroy
    @manager.destroy
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_manager
    @manager = Manager.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def manager_params
    params.require(:manager).permit(:name, :email)
  end

  def authenticate_request
    @current_manager = AuthorizeManagerApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_manager
  end
end
