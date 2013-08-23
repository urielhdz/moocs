class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.text :body
      t.references :student, index: true

      t.timestamps
    end
  end
end
