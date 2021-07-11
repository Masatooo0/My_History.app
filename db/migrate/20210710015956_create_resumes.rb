class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.date :period
      t.string :content
      t.boolean :status

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
