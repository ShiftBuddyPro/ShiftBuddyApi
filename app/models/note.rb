class Note < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  default_scope { order(created_at: :desc) }

  belongs_to :shift

  def to_activity
    "#{shift.employee.name} just wrote a note: #{title ? title + ' - ' : ''}#{message}"
  end
end
