class CreateAdvantages < ActiveRecord::Migration[5.2]
  def change
    create_table :advantages do |t|
      t.integer :history_id
      t.string :advantage
      t.timestamps
    end
  end
end
