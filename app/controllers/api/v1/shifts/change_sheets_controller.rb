class Api::V1::Shifts::ChangeSheetsController < ApplicationController
  before_action :set_change_sheet, only: [:show, :update]

  # GET /change_sheets/1
  def show
    render json: @change_sheet
  end

  # PATCH/PUT /change_sheets/1
  def update
    if @change_sheet.update(change_sheet_params)
      render json: @change_sheet
    else
      render json: @change_sheet.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_change_sheet
      @change_sheet = Shift.find(params[:shift_id]).change_sheet
    end

    # Only allow a trusted parameter "white list" through.
    def change_sheet_params
      params.require(:change_sheet)
            .permit(
              :start_pennies,
              :start_nickels,
              :start_dimes,
              :start_quarters,
              :start_ones,
              :start_fives,
              :start_tens,
              :start_twenties,
              :end_pennies,
              :end_nickels,
              :end_dimes,
              :end_quarters,
              :end_ones,
              :end_fives,
              :end_tens,
              :end_twenties
            )
    end
end
