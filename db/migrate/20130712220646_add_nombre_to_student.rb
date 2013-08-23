class AddNombreToStudent < ActiveRecord::Migration
  def change
    add_column :students, :nombre, :string
    add_column :students, :apellido, :string
    add_column :students, :biografia, :text
    add_column :students, :img, :string
  end
end
