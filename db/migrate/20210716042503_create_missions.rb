class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.text :content, null: false
      t.datetime :deadline, null: false
      t.boolean :status, default: false, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
