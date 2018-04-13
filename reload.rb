require 'yaml'
require 'twitter'

tweets = YAML.load_file('tweets.yml')
print tweets
