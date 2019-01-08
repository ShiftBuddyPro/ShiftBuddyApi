class Api::V1::Managers::ActivityLogsController < ApplicationController
  # before_action -> { render_unauthorized unless current_user_is?(manager) || current_user_is?(employee) }

  # GET /shifts
  def index
    activities = []
    if manager.shifts.first
      shift = manager.shifts.first
      activities.push(shift.notes.reverse[0..4], shift.checks.reverse[0..4], shift.paid_outs.reverse[0..4])
      activities = activities.flatten
      recent_activities = []
      activities.sort_by(&:created_at)
      (0..9).each do |i|
        break if recent_activities.length == activities.length

        recent_activities.push(activities[i])
      end
      activities = []
      recent_activities.map do |activity|
        employee_name = activity.shift.employee.name
        p activity.created_at
        case activity.class.to_s
        when 'Check'
          activities << "#{employee_name} just wrote a check to #{activity.company} for $#{activity.amount}"
        when 'Note'
          activities << "#{employee_name} just wrote a note: #{activity.title ? activity.title +  ' - ' : ''}#{activity.message}"
        when 'PaidOut'
          activities << "#{employee_name} just made a paid out to #{activity.company} for $#{activity.amount}"
        end
      end
    end
    render json: activities
  end

  private

  def manager
    @manager ||= Manager.find params[:manager_id]
  end
end
