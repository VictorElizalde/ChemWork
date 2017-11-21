class AddUrlToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :url, :string
  end
end
