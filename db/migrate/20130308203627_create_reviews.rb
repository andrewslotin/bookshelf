class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :book, null: false
      t.integer :rating, null: false, default: 0
      t.text :body

      t.timestamps
    end
  end
end
