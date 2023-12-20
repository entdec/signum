class AddSubjectToSignals < ActiveRecord::Migration[6.1]
  def change
    add_reference :signum_signals, :subjectable, type: :uuid, polymorphic: true, null: true
  end
end
