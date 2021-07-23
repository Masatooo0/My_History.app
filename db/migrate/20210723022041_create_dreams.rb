class CreateDreams < ActiveRecord::Migration[5.2]
  def change
    create_table :dreams do |t|
      t.string :content
      
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
