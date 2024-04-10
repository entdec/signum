class AddKeyToSignal < ActiveRecord::Migration[7.1]
  def change
    add_column :signum_signals, :key, :string
    add_index :signum_signals, :key
    # t.references :signalable, polymorphic: true, optional: false, null: false, type: :uuid
    # t.string "signalable_type", null: false
    # t.uuid "signalable_id", null: false
    change_column_null :signum_signals, :signalable_type, true
    change_column_null :signum_signals, :signalable_id, true
  end

  def down
    remove_column :signum_signals, :key, :string
    remove_index :signum_signals, :key
    # t.references :signalable, polymorphic: true, optional: false, null: false, type: :uuid
    # t.string "signalable_type", null: false
    # t.uuid "signalable_id", null: false
    change_column_null :signum_signals, :signalable_type, false
    change_column_null :signum_signals, :signalable_id, false
  end
end
