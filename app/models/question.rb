class Question < ActiveRecord::Base
  attr_accessible :answer, :title

  validates :title, presence: true
end
