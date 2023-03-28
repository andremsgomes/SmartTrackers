class CreateGaugeEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :gauge_entries do |t|
      t.bigint :gauge_id, unsigned: true, null: false
      t.decimal :value, unsigned: true, null: false

      t.timestamps
    end

    add_index :gauge_entries, :gauge_id
  end
end
