class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false
      t.references :mission, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
