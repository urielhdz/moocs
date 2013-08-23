class Friendship < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :friend
      t.references :student
      t.timestamps
    end
  end
end
