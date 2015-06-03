class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.string :name
      t.string :design
      t.text :description

      t.timestamps null: false
    end
  end
end
