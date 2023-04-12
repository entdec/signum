class AddColumnsToSignumSignal < ActiveRecord::Migration[6.1]
  def change
    add_column :signum_signals, :metadata, :jsonb
    add_column :signum_signals, :total, :integer
    add_column :signum_signals, :count, :integer
  end
end
