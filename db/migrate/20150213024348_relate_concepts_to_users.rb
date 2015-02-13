class RelateConceptsToUsers < ActiveRecord::Migration
  def change
    add_reference :concepts, :user, index: true
  end
end
