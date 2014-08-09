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
