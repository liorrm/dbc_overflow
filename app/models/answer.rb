class Answer < ActiveRecord::Base
  validates_presence_of :title, :content
  belongs_to :question
  has_many :votes, as: :votable, dependent: :destroy
end
