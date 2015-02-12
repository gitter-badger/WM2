class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|
      t.string :title
      t.text :content
      t.text :description

      t.timestamps null: false
    end
  end
end
