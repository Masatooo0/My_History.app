class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :action
      t.boolean :checked, default: false, null: false
      t.references :mission, null: false,foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
