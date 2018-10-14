class Shift < ApplicationRecord
  belongs_to :employee

  has_many :notes
  has_many :checks
end
