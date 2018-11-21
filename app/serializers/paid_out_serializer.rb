class PaidOutSerializer < ApplicationSerializer
  attribute :id, :company, :amount

  belongs_to :shift
end
