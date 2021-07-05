class CreateReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :reasons do |t|
      t.text :reason, null: false

      t.references :history, null: false, foreign_key: true
      t.timestamps
    end
  end
end
