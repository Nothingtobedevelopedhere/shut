require 'twitter_ebooks'

# This is an example bot definition with event handlers commented out
# You can define and instantiate as many bots as you like

class MyBot < Ebooks::Bot
  # Configuration here applies to all MyBots
  def configure
    # Consumer details come from registering an app at https://dev.twitter.com/
    # Once you have consumer details, use "ebooks auth" for new access tokens
    self.consumer_key = '3zEYURy0LGgd7x5agEr75jmEN' # Your app consumer key
    self.consumer_secret = 'hMYi9NnNyhDxmb1RTCP1pzk7rwP0ozs2y7AOsi8LoJuXis54bG' # Your app consumer secret

    # Users to block instead of interacting with
    self.blacklist = ['tnietzschequote']

    # Range in seconds to randomize delay when bot.delay is called
    self.delay_range = 1..6
  end

  def on_startup
    scheduler.every '1h' do
      # Tweet something every 24 hours
      # See https://github.com/jmettraux/rufus-scheduler
      # tweet("hi")
      # pictweet("hi", "cuteselfie.jpg")
    end
  end

  def on_message(dm)
    # Reply to a DM
    # reply(dm, "secret secrets")
  end

  def on_follow(user)
    # Follow a user back
    # follow(user.screen_name)
  end

  def on_mention(tweet)
    # Reply to a mention
    # reply(tweet, "oh hullo")
  end

  def on_timeline(tweet)
    # Reply to a tweet in the bot's timeline
    # reply(tweet, "nice tweet")
  end

  def on_favorite(user, tweet)
    # Follow user who just favorited bot's tweet
    # follow(user.screen_name)
  end

  def on_retweet(tweet)
    # Follow user who just retweeted bot's tweet
    # follow(tweet.user.screen_name)
  end
end

# Make a MyBot and attach it to an account
MyBot.new("kirchbot") do |bot|
  bot.access_token = "834226336495521792-HpXGQfnq7n77Kl0N34G1yb6cEN3AY29" # Token connecting the app to this account
  bot.access_token_secret = "1J4P7RijjwWjyytxcPqLTDfQVziyZkWYUXtwsn9dKcbuu" # Secret connecting the app to this account
end
