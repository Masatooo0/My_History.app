class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.date :period, null: false
      t.string :content, null: false
      t.boolean :status, null: false

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
