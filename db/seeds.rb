# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

resources = %i[
  manager
  employee
  shift
  cash_drop
  check
  note
  paid_out
  inventory_item
]

resources.each do |resource|
  10.times { FactoryBot.create resource }
end
