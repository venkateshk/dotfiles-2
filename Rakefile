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
    else
      execute_cmd "xcode-select --install"
    end

    #result = execute_cmd("brew -v")
    #unless result.first.include?("Homebrew")
      #execute_cmd "ruby -e '$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)'" # install homebrew
    #end
    
    execute_cmd "ruby -e '$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)'"

    puts ""
    puts "## Everything looks good and you are all set. Go ahead and follow the next instruction. ##"
  end

  task :setup do

      execute_cmd "git config --global alias.co checkout"
      execute_cmd "git config --global color.branch auto"
      execute_cmd "git config --global color.diff auto" 
      execute_cmd "git config --global color.interactive auto"
      execute_cmd "git config --global color.status auto"
      execute_cmd "git config --global branch.autosetuprebase always"
      execute_cmd "git config --global push.default current"

      # Typicall when I merge master into production git opens editor for me to type merge message.
      # Personally I do not want git to ask me to enter anything when I am merging a branch into another.
      # Following code is to silence git.
      execute_cmd "git config --global core.mergeoptions --no-edit"

      %w(bash_profile gemrc bashrc).each { |file| process_file(file) }

      extend_bashrc_with_aliases_and_other_things

      add_scripts_to_path
  end

  task :brew do

    # Make sure we’re using the latest Homebrew
    execute_cmd "brew update"

    # Upgrade any already-installed formulae
    execute_cmd "brew upgrade"

    # Install Bash 4
    execute_cmd "brew install bash"

    # Install wget with IRI support
    execute_cmd "brew install wget --enable-iri"

    execute_cmd "brew install ack"
    execute_cmd "brew install git"
    execute_cmd "brew install rename"
    execute_cmd "brew install tree"
    execute_cmd "brew install ssh-copy-id"
    execute_cmd "brew install git bash-completion"
    execute_cmd "brew install hub"
    execute_cmd "brew install imagemagick"

    # this is needed for gem install pg to work
    execute_cmd "brew install postgresql"

    # Remove outdated versions from the cellar
    execute_cmd "brew cleanup"

  end

  task :rbenv do
    execute_cmd "git clone https://github.com/sstephenson/rbenv.git ~/.rbenv"
    execute_cmd "git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"
    execute_cmd "git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash"
    execute_cmd "rbenv install 2.0.0-p247"
    execute_cmd "rbenv global 2.0.0-p247"
    execute_cmd "gem install bundler"
  end

end

task :default => "machine:setup"
