class AddLinksAndButtonsToSignals < ActiveRecord::Migration[7.1]
  def change
    add_column :signum_signals, :links, :jsonb
    add_column :signum_signals, :buttons, :jsonb
  end
end
