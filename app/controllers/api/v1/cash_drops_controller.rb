class Api::V1::CashDropsController < ApplicationController
  before_action :set_cash_drop, only: [:show, :update, :destroy]

  # GET /cash_drops
  def index
    @cash_drops = CashDrop.all

    render json: @cash_drops
  end

  # GET /cash_drops/1
  def show
    render json: @cash_drop
  end

  # POST /cash_drops
  def create
    @cash_drop = CashDrop.new(cash_drop_params)

    if @cash_drop.save
      render json: @cash_drop, status: :created
    else
      render json: @cash_drop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cash_drops/1
  def update
    if @cash_drop.update(cash_drop_params)
      render json: @cash_drop
    else
      render json: @cash_drop.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cash_drops/1
  def destroy
    @cash_drop.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_drop
      @cash_drop = CashDrop.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cash_drop_params
      params.require(:cash_drop).permit(:amount, :number, :shift_id)
    end
end
