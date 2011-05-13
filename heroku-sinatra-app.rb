# You'll need to require these if you
# want to develop while running with ruby.
# The config/rackup.ru requires these as well
# for it's own reasons.
#
# $ ruby heroku-sinatra-app.rb
#
require 'rubygems'
require 'sinatra'
require "haml"
configure :production do
  # Configure stuff here you'll want to
  # only be run at Heroku at boot

  # TIP:  You can get you database information
  #       from ENV['DATABASE_URI'] (see /env route below)
end

helpers do 
  def google_translate (words)
    {
    :href => "https://www.googleapis.com/language/translate/v2?key=AIzaSyBqpzeN8u93VFsqG8Fe58odm_IFNPPz5BI&source=zh-CN&target=ja",
    :q => words,
    # :source => 'en',
    :target => 'ja'
    }
   end
end

get '/translate' do
  tran_words = params[:q]
  haml :index ,:local => {:words => google_translate(tran_words)}
end

# Quick test
get '/style.css' do
  sass :style
end

get '/' do
  haml :index
end


# Test at <appname>.heroku.com

# You can see all your app specific information this way.
# IMPORTANT! This is a very bad thing to do for a production
# application with sensitive information

# get '/env' do
#   ENV.inspect
# end
