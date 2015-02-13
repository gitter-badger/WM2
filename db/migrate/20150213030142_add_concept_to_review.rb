class AddConceptToReview < ActiveRecord::Migration
  def change
    add_reference :reviews, :concept, index: true
    add_foreign_key :reviews, :concepts
  end
end
