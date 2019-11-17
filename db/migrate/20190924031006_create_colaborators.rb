class CreateColaborators < ActiveRecord::Migration[6.0]
  def change
    create_table :colaborators do |t|
      t.text :name
      t.text :address
      t.text :refer
      t.text :message
      t.text :image
      t.text :lat
      t.text :lon

      t.timestamps
    end
  end
end
