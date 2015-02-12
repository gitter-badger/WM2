class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user
      t.text :content
      t.integer :concept
      t.integer :rating

      t.timestamps null: false
    end
  end
end
