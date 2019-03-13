require 'rails_helper'

describe Tweet do
  describe '#by_date' do
    it 'should return tweets ordered by their published_date' do
      one = Tweet.create(published_date: DateTime.now, content: 'hello world')
      three = Tweet.create(published_date: DateTime.now - 3.minutes, content: 'this is a tweet')
      five = Tweet.create(published_date: DateTime.now - 5.minutes, content: 'goodbye')

      expect(Tweet.all.by_date.first).to eq one
    end
  end
end
