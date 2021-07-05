class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :period
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
