class CreateGauges < ActiveRecord::Migration[7.0]
  def change
    create_table :gauges do |t|
      t.string :name
      t.string :begin_date
      t.string :end_date
      t.string :unit
      t.string :time_unit

      t.timestamps
    end
  end
end
