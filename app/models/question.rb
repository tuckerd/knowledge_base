class Question < ActiveRecord::Base
  has_and_belongs_to_many :users

  attr_accessible :answer, :title

  validates :title, presence: true
end
