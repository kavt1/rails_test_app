class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates :content, :rating, :restaurant_id, presence: true
  validates :rating, inclusion: { in: [0,1,2,3,4,5] , allow_nil: false }
end
