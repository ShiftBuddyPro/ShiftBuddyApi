require 'test_helper'

class Api::V1::Managers::Employees::Shifts::NotesControllerTest < ActionDispatch::IntegrationTest
  attr_reader :manager, :employee, :shift, :note

  setup do
    @manager = create :manager
    @employee = create :employee, manager: manager
    @shift = create :shift, employee: employee
    @note = create :note, shift: shift
  end

  test 'should get shifts notes' do
    get "/api/v1/managers/#{manager.id}/employees/#{employee.id}/shifts/#{shift.id}/notes"
    assert_response :success
    assert_json(@response.body) do
      item 0 do
        has :id, note.id
        has :start_amount, note.start_amount
        has :end_amount, note.end_amount
        has :name, note.name
        has :shift_id, shift.id
        has :created_at
        has :updated_at
      end
    end
  end

  test 'should create cash drop' do
    assert_difference 'Note.count' do
      post "/api/v1/managers/#{manager.id}/employees/#{employee.id}/shifts/#{shift.id}/notes", params: note_params
    end
    assert_response :success
  end

private

  def note_params
    {
      note: {
        name: Faker::Beer.name,
        start_amount: Faker::Number.number(2),
        end_amount: Faker::Number.number(2),
        shift_id: shift.id
      }
    }
  end
end
