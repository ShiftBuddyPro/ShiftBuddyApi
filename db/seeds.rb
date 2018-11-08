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
usman = Manager.find_by(email: 'usman')

100.times do
  FactoryBot.create(:employee, manager_id: usman.id)
  FactoryBot.create(:shift, employee_id: usman.employees.first.id)
  (4..7).each do |i|
    FactoryBot.create(resources[i], shift_id: usman.employees.first.shifts.first.id)
  end
end
resources.each do |resource|
  10.times { FactoryBot.create resource }
end
