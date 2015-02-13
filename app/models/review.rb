class Review < ActiveRecord::Base
  belongs_to :concept
  belongs_to :user

  validates :content, presence: true
end
