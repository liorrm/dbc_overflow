  class Quote < ActiveRecord::Base
  def self.rand_quote
    limit = rand(Quote.count)
    rand_quote = Quote.offset(limit).first.quote
  end
end