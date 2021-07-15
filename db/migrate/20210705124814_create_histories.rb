class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string  :title,      null: false#タイトル
      t.text    :event,      null: false#出来事
      t.integer :motivation, null: false#モチベーション度

      t.references :user, null: false, foreign_key: true
      t.references :period, null: false, foreign_key: true
      t.timestamps
    end
  end
end
