class EditUsers < ActiveRecord::Migration
  def change
    remove_column :auths, :auth_code
    add_column :auths, :auth_token, :string
  end
end
