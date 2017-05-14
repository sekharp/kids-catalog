class CreateUsersBooksJoinTable < ActiveRecord::Migration
  def change
    create_table :user_books do |t|
      t.boolean :favorited, default: false
      t.boolean :read, default: false
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
