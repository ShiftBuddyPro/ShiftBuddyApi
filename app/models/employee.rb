class Employee < ApplicationRecord
  has_secure_password

  belongs_to :manager, optional: true
  has_many :shifts

  default_scope { order(created_at: :desc) }

  enum status: %i[not_working working]

  def status
    working? ? :working : :not_working
  end

  def working?
    return false if shifts.empty?

    current_shift.active?
  end

  def current_shift
    return if !working || shifts.empty?

    shifts.last
  end
end
