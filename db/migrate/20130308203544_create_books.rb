class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :author, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
