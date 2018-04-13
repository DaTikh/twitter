require 'pry'
require 'twitter'
require 'dotenv'
require 'yaml'

Dotenv.load

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['TWITTER_TOKEN']
  config.access_token_secret = ENV['TWITTER_TOKEN_SECRET']
end

# topics = ["coffee", "tea"]
# client.filter(track: topics.join(",")) do |object|
#   puts object.text if object.is_a?(Twitter::Tweet)
#   binding.pry
# end

# tweets = client.user_timeline('AFPBordeaux', count: 10)
# tweets.each { |tweet| puts tweet.full_text }
# File.write('tweets.yml', YAML.dump(tweets))
# binding.pry

client.search("to:rekkleslol stream", result_type: "recent").take(3).collect do |tweet|
  puts"#{tweet.user.screen_name}: #{tweet.text}"
end
