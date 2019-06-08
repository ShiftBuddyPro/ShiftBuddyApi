require 'test_helper'

class Api::V1::NotesControllerTest < ActionDispatch::IntegrationTest
  attr_reader :note, :shift

  setup do
    @shift = create :shift
    @note = create :note, shift: shift
  end

  test 'should show all notes' do
    get '/api/v1/notes'
    assert_response :success
  end

  test 'should show note' do
    get "/api/v1/notes/#{note.id}"
    assert_response :success
  end

  test 'should update note' do
    put "/api/v1/notes/#{note.id}", params: note_params
    assert_response :success
  end

  test 'should delete note' do
    assert_difference 'Note.count', -1 do
      delete "/api/v1/notes/#{note.id}"
    end
    assert_response :success
  end

  private

  def note_params
    { note: { tite: 'title', message: 'message', shift_id: shift.id } }
  end
end
