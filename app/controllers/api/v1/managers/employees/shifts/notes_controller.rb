class Api::V1::Managers::Employees::Shifts::NotesController < Api::EmployeeApplicationController
  def index
    notes = Shift.find(params[:shift_id]).notes
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
    params.require(:note).permit(:title, :message, :shift_id)
  end
end
