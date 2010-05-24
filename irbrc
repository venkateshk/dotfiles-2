#
# save this file as ~/.irbrc
# 
# this utility will print the sql statement in the ruby script/console instead of regular development.log file
#
# sudo gem install wirble
# sudo gem install utility_belt
# sudo gem install cldwalker-hirb --source http://gems.github.com
# require 'hirb'
# Hirb.enable

require 'rubygems'
require 'logger'

if ENV['RAILS_ENV'] || defined?(Rails) 
  puts 'env is true or Rails is true'
  if ENV['RAILS_ENV'] # rails 2.x
    Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT)) 
    ActiveRecord::Base.logger = Logger.new(STDOUT) 
  elsif defined?(Rails) # rails 3.x
    ActiveRecord::Base.logger = Logger.new(STDOUT) 
  else
  end

  def sql(query)
    ActiveRecord::Base.connection.select_all(query)
  end
else
end

#require 'wirble'
#Wirble.init
#Wirble.colorize
#require 'ab'
