class AddApprovedToGaugeEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :gauge_entries, :approved, :boolean, default: false
  end
end
