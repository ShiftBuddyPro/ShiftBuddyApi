class Api::V1::PaidOutsController < ApplicationController
  before_action :set_paid_out, only: [:show, :update, :destroy]

  # GET /paid_outs
  def index
    @paid_outs = PaidOut.all

    render json: @paid_outs
  end

  # GET /paid_outs/1
  def show
    render json: @paid_out
  end

  # POST /paid_outs
  def create
    @paid_out = PaidOut.new(paid_out_params)

    if @paid_out.save
      render json: @paid_out, status: :created
    else
      render json: @paid_out.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /paid_outs/1
  def update
    if @paid_out.update(paid_out_params)
      render json: @paid_out
    else
      render json: @paid_out.errors, status: :unprocessable_entity
    end
  end

  # DELETE /paid_outs/1
  def destroy
    @paid_out.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paid_out
      @paid_out = PaidOut.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def paid_out_params
      params.require(:paid_out).permit(:company, :amount, :shift_id)
    end
end
