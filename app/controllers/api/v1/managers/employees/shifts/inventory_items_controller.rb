class Api::V1::Managers::Employees::Shifts::InventoryItemsController < Api::EmployeeApplicationController
  def index
    inventory_items = Shift.find(params[:shift_id]).inventory_items
    render json: inventory_items.all
  end

  def create
    inventory_item = InventoryItem.new(inventory_item_params)
    if inventory_item.save
      render json: inventory_item, status: :created
    else
      render json: inventory_item.errors, status: :unprocessable_entity
    end
  end

private

  def inventory_item_params
    params.require(:inventory_item).permit(:start_amount, :end_amount, :name, :shift_id)
  end
end
