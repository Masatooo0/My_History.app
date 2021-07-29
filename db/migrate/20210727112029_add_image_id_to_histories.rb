class AddImageIdToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :image_id, :string
  end
end
