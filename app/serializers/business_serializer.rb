class BusinessSerializer < ApplicationSerializer
  attributes :name, :address1, :city, :state, :zip_code
  belongs_to :manager
end
