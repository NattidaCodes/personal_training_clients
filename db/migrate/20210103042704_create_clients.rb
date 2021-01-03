class CreateClients < ActiveRecord::Migration
  def change 
    create_table :clients do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.integer :weight
      t.integer :user_id
    end
  end
end
