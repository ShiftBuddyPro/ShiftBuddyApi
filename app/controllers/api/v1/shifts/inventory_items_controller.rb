class Api::V1::Managers::Employees::Shifts::InventoryItemsController < Api::EmployeeApplicationController
  def index
    inventory_items = shift.inventory_items
    render json: inventory_items.all
  end

private

  def shift
    @shift ||= Shift.find(params[:shift_id])
  end
end
