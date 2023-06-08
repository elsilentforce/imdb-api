class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :imdb_id, null: false
      t.string :title, null: false
      t.integer :raiting
      t.boolean :watched, default: false
      t.string :comment

      t.timestamps
    end
  end
end
