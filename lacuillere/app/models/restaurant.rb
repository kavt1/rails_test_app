class Restaurant < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy
  validates :name, :address, presence: true
  validates :category, presence: true
  validates_inclusion_of :category, :in => ["chinese", "italian", "japanese", "french", "belgian"]
end
