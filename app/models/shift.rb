class Shift < ApplicationRecord
  belongs_to :employee
  has_many :notes, :checks
end
