class CreateNotetags < ActiveRecord::Migration[5.1]
  def change
    create_table :notetags do |t|
      t.references :note, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
