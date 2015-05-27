class CreateAuths < ActiveRecord::Migration
  def change
    create_table :auths do |t|
      t.integer :user_id, null: false
      t.string :auth_code, null: false
      t.string :auth_type, null: false

      t.timestamps
    end
  end
end
