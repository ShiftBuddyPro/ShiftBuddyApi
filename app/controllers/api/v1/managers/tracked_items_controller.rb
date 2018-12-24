class Api::V1::Managers::TrackedItemsController < ApplicationController
  before_action :set_tracked_item, only: [:show, :update, :destroy]

  # GET /tracked_items
  def index
    @tracked_items = manager.tracked_items

    render json: @tracked_items
  end

  # POST /tracked_items
  def create
    @tracked_item = TrackedItem.new(tracked_item_params)

    if @tracked_item.save
      render json: @tracked_item, status: :created
    else
      render json: @tracked_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tracked_items/1
  def destroy
    @tracked_item.destroy
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_tracked_item
    @tracked_item = TrackedItem.find(params[:id])
  end

  def manager
    @manager ||= Manager.find(params[:manager_id])
  end

  # Only allow a trusted parameter "white list" through.
  def tracked_item_params
    params.require(:tracked_item).permit(:name).merge(manager_id: manager.id)
  end
end
