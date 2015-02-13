class Concept < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :title, :content, :description, presence: true
end
