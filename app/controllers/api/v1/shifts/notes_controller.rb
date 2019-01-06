class Api::V1::Shifts::NotesController < ApplicationController
  def index
    notes = Shift.find(shift_id).notes
    render json: notes.all
  end

private

  def shift_id
    @shift_id ||= params[:shift_id]
  end
end
