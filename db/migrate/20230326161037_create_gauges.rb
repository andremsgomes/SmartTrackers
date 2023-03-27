class CreateGauges < ActiveRecord::Migration[7.0]
  def change
    create_table :gauges do |t|
      t.string :name
      t.datetime :begin_date
      t.datetime :end_date
      t.integer :unit
      t.integer :time_unit

      t.timestamps
    end
  end
end
