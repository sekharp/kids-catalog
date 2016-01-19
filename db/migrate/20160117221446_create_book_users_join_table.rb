class CreateBookUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :books, :users do |t|
      t.index :book_id
      t.index :user_id
      t.boolean :favorited
      t.boolean :read
    end
  end
end
