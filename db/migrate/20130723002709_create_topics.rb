class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :titulo
      t.integer :corte
      t.references :course, index: true
      t.text :descripcion

      t.timestamps
    end
  end
end
