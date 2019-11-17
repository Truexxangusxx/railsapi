class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :password
      t.text :repassword
      t.text :token
      t.text :retoken
      t.text :code

      t.timestamps
    end
  end
end
