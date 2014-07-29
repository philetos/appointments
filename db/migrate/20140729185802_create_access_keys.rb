class CreateAccessKeys < ActiveRecord::Migration
  def change
    create_table :access_keys do |t|
      t.string :token

      t.timestamps
    end

    add_index :access_keys, :token  
  end
end
