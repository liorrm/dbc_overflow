class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :votable_id
      t.string :votable_type
      t.string :direction
    end
  end
end
