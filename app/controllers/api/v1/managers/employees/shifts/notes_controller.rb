class Api::V1::Managers::Employees::Shifts::NotesController < Api::EmployeeApplicationController
  def index
    notes = Shift.find(shift_id).notes
    render json: notes.all
  end

  def create
    note = Note.new(note_params)
    if note.save
      render json: note, status: :created
    else
      render json: note.errors, status: :unprocessable_entity
    end
  end

private

  def note_params
    params.require(:note).permit(:title, :message).merge(shift_id: shift_id)
  end

  def shift_id
    @shift_id ||= params[:shift_id]
  end
end
