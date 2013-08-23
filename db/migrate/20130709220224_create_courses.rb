class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :titulo
      t.string :slugg
      t.text :descripcion
      t.integer :dificultad
      t.string :imgExt

      t.timestamps
    end
  end
end
