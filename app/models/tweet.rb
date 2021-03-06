class Tweet < ApplicationRecord
  scope :by_date, -> { order(published_date: :desc).take(10)}

  def self.retrieve_recent_tweets(topic)
    response_body = HTTP.headers(
        :Authorization => "bearer #{ENV['TWITTER_TOKEN']}"
      ).get("#{ENV['TWITTER_HOST']}/search/tweets.json?q=#{topic}&result_type=recent").body

    result = JSON.parse(response_body)
    result['statuses'].each do |tweet|
        next if Tweet.find_by(content: tweet['text'])
        Tweet.create(topic: topic, author: tweet['user']['screen_name'], content: tweet['text'], published_date: tweet['created_at'])
    end
  end

  def self.post(content)
    request = {
      :headers => {
        :Authorization => "bearer #{ENV['TWITTER_TOKEN']}"
      },
      :body => content
    }

    response = HTTP.post("#{ENV['TWITTER_HOST']}/statuses/update.json", request)

    puts " this is the response --> #{response}"
  end
end
