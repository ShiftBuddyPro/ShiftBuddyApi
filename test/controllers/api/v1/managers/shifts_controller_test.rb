require 'test_helper'

class Api::V1::Managers::ShiftsControllerTest < ActionDispatch::IntegrationTest
  attr_accessor :manager, :employee, :shift, :shift2, :token

  setup do
    @manager = create :manager, name: 'real one'
    @employee = create :employee, manager: manager
    @shift = create :shift, employee: employee
    @shift2 = create :shift, employee: employee
    sign_in manager
  end

  test 'should get specific managers shifts' do
    get "/api/v1/managers/#{manager.id}/shifts"
    assert_response :success
    assert_json(@response.body) do
      has :data do
        item 0 do
          has :id, shift2.id.to_s
          has :attributes do
            has :id, shift.id
            has :employee_name, shift.employee.name
            has :date
          end
        end
        item 1 do
          has :id, shift.id.to_s
          has :attributes do
            has :id, shift.id
            has :employee_name, shift2.employee.name
            has :date
          end
        end
      end
    end
  end

private

  def employee_params
    password = Faker::Internet.password
    {
      employee: {
        name: Faker::Name.first_name,
        username: Faker::Internet.username,
        password: password,
        password_confirmation: password,
        manager_id: manager.id
      }
    }
  end
end
