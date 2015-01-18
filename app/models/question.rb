class Question < ActiveRecord::Base
  validates_presence_of :title, :content
  has_many :answers
  has_many :votes, as: :votable, dependent: :destroy

  def total_votes
    upvotes = self.votes.where(direction: "up").count
    downvotes = self.votes.where(direction: "down").count
    total_votes = upvotes - downvotes
    return total_votes
  end
end
