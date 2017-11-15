class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :lab_phase
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.text :shared_with
      t.references :user, foreign_key: true
      t.references :assignment, foreign_key: true

      t.timestamps
    end
  end
end
