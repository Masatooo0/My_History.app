class AddSummarizeToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :summarize, :text
  end
end
