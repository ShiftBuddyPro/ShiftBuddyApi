class Api::V1::Managers::Employees::Shifts::CashDropsController < Api::EmployeeApplicationController
  def index
    cash_drops = Shift.find(shift_id).cash_drops
    render json: cash_drops.all
  end

  def create
    cash_drop = CashDrop.new(cash_drop_params)
    if cash_drop.save
      render json: cash_drop, status: :created
    else
      render json: cash_drop.errors, status: :unprocessable_entity
    end
  end

  private

  def cash_drop_params
    params.require(:cash_drop).permit(:amount, :number).merge(
      shift_id: shift_id
    )
  end

  def shift_id
    @shift_id ||= params[:shift_id]
  end
end
