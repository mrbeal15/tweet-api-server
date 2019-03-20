class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.by_date
    render json: @tweets
  end

  def show
    begin
      topic = request.query_parameters[:topic].gsub(' ', '%20')
      Tweet.retrieve_recent_tweets(topic)

      @filtered_tweets = Tweet.where(topic: topic).by_date
      render json: @filtered_tweets
    rescue Exception => e
      puts "Something went wrong: #{e}"
      render json: {error: e}
    end
  end

  def create
    Tweet.post(get_content[:content])
  end

  private

  def get_content
    params.permit(:content)
  end
end
