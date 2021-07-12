class CreateAdvantages < ActiveRecord::Migration[5.2]
  def change
    create_table :advantages do |t|
      t.integer :history_id
      t.string :advantage
      t.timestamps

      t.references :user, null: false, foreign_key: true
      t.references :history, null: false, foreign_key: true
    end
  end
end
