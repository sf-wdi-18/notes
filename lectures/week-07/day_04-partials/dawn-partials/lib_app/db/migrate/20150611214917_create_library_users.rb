class CreateLibraryUsers < ActiveRecord::Migration
  def change
    create_table :library_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :library, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
