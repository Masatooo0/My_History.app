class CreatePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :periods do |t|
      t.integer :period, null: false

      t.references :chronology, null: false, foreign_key: true
      t.timestamps
    end
  end
end
