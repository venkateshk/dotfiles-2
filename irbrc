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
#require 'wirble'
require 'logger'

puts 'loading irbrc'

if ENV['RAILS_ENV'] || defined?(Rails) 
  puts 'env is true or Rails is true'
  if ENV['RAILS_ENV'] # rails 2.x
    puts 'Rails2'
    Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT)) 
    ActiveRecord::Base.logger = Logger.new(STDOUT) 
  elsif defined?(Rails) # rails 3.x
    puts 'Rails3'
    ActiveRecord::Base.logger = Logger.new(STDOUT) 
  else
    puts 'irbrc not rails2. not rails3' 
  end

  def sql(query)
    ActiveRecord::Base.connection.select_all(query)
  end
else
  puts 'not ENV not Rails'
end

#Wirble.init
#Wirble.colorize
#require 'ab'
