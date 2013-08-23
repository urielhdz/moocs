class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :titulo
      t.text :descripcion
      t.date :entrega
      t.references :course, index: true

      t.timestamps
    end
  end
end
