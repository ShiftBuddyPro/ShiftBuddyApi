class Api::V1::Managers::ActivityLogsController < ApplicationController
  # before_action -> { render_unauthorized unless current_user_is?(manager) || current_user_is?(employee) }

  # GET /shifts
  def index
    render json: recent_activities
  end

  private

  def recent_activities
    manager.shifts.first(5).map(&:recent_activities).flatten
  end

  def manager
    @manager ||= Manager.find params[:manager_id]
  end
end
