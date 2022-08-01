class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :kind
      t.string :password
      t.integer :status
      t.string :password_confirmation
      t.string :password_digest
      t.timestamps
    end
  end
end
