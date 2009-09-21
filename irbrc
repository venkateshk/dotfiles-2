require 'rubygems'
require 'utility_belt'

if ENV['RAILS_ENV']
  require 'logger'
  Object.const_set(:RAILS_DEFAULT_LOGGER, Logger.new(STDOUT))

  def sql(query)
  ActiveRecord::Base.connection.select_all(query)
  end
end

