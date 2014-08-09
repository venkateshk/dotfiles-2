# ruby 1.8.7 that is shipped with Maverick does not have require_realtive
unless Kernel.respond_to?(:require_relative)
  module Kernel
    def require_relative(path)
      require File.join(File.dirname(caller[0]), path.to_str)
    end
  end
end

require 'rubygems'
require_relative './scripts/common'

def process_file file
  expanded_path = File.expand_path("~/.#{file}")

  if File.exist?(expanded_path)
    suffix = Time.now.to_s.gsub(/[-\s\:\+]+/, '-') 
    execute_cmd("mv #{expanded_path} #{expanded_path}-#{suffix}")
  end
  execute_cmd("touch #{expanded_path}") 
  execute_cmd "cat #{Dir.pwd}/#{file}  > #{expanded_path}"

  personal_file = "#{Dir.pwd}/personal/#{file}"
  if File.exists?(personal_file)
    execute_cmd "cat #{personal_file}  >> #{expanded_path}"
  end
end

def extend_bashrc_with_aliases_and_other_things
  statements = []
  statements << "aliases/misc_aliases.sh"
  statements << "aliases/rails_aliases.sh"
  statements << "aliases/git_aliases.sh"
  statements << "aliases/git_aliases.sh"
  statements << "bashrc_ext/command_prompt.sh"
  statements << "bashrc_ext/rails_commands.sh"
  statements << "bashrc_ext/add_dotfile_scripts_to_path.sh"

  statements.each do |statement| 
    statement = %Q{ ". '#{Dir.pwd}/#{statement}'" }
    execute_cmd("echo #{statement} >> ~/.bashrc")
  end
end

def add_scripts_to_path
  statement = %Q{export PATH="#{Dir.pwd}/scripts:$PATH"}
  expanded_path = File.expand_path("~/.bashrc")
  File.open(expanded_path, 'a') { |file| file.write(statement) }
end

namespace :machine do

  task :initial_check do
    result = execute_cmd("sw_vers | grep ProductVersion")
    unless result.first.include?("10.9")
      puts "Looks like you are not using OSX maverick."
      puts "visit http://www.apple.com/osx/how-to-upgrade/ to see how to upgrade your OS to 10.9"
      puts "Once the OXS has been upgraded then execute the command rake machine:initial_check again."
      abort
    end

    result = execute_cmd("xcode-select -p")
    if result.first.include?("/Applications/Xcode.app/Contents/Developer") || result.first.include?("CommandLineTools")
      ## continue
    else
      execute_cmd "xcode-select --install"
    end

    puts ""
    puts "## Everything looks good and you are all set. Go ahead and follow the next instruction. ##"
  end

end
