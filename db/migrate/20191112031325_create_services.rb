class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.text :name
      t.text :icon
      t.text :color

      t.timestamps
    end
  end
end
