class Review < ActiveRecord::Base
  belongs_to :concept
  belongs_to :user
end
