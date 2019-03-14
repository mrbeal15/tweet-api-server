require 'rails_helper'

describe TweetsController do
  before :each do
    (0..2).each { |i| Tweet.create(content: "test tweet number #{i}", topic: 'test')}
  end

  describe '#index' do
    it 'should return a success' do
      get :index

      assert_response :success
    end
  end

  describe '#show' do
    xit 'should return tweets that match the topic' do
      Tweet.create(content: 'This tweet is about chess', topic: 'chess')
      get :show, params: { topic: 'test' }

      assert_response :success
    end
  end
end
