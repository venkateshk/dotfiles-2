#
# >>> save this file as .irbrc at ~
# 
# this utility will print the sql statement in the ruby script/console instead of regular development.log file
#
# sudo gem install utility_belt
# sudo gem install cldwalker-hirb --source http://gems.github.com

require 'rubygems'
require 'hirb'
Hirb.enable

require 'utility_belt'

if ENV['RAILS_ENV']
  require 'logger'
  Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))
  def sql(query)
    ActiveRecord::Base.connection.select_all(query)
  end
end
