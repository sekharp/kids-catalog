class EditUserTable < ActiveRecord::Migration
  def change
    remove_column :users, :name
    remove_column :users, :screenname
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :token, :string
    add_column :users, :email, :string
    add_column :users, :image_url, :string
    add_column :users, :token_expires_at, :datetime
  end
end
