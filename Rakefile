require 'rubygems'
require 'open3'

def execute_cmd cmd
  puts cmd

  Open3.popen2e(cmd) do |stdin, stdout_err, wait_thr|
    while line = stdout_err.gets
      puts line
    end

    exit_status = wait_thr.value
    unless exit_status.success?
      abort "FAILED !!! #{cmd}"
    end
  end
end

def backup_file file
  file1 = "~/.#{file}"
  expanded_path = File.expand_path(file1)

  if File.symlink?(expanded_path)
    puts ''
    puts "#{file1} is symlink to #{File.readlink(expanded_path)}"
    puts ''
    FileUtils.rm expanded_path
  elsif File.exists?(expanded_path)
    execute_cmd "git mv #{expanded_path} #{expanded_path}-#{Time.now.strftime('%Y-%m-%d-T%H%M%S%z')}"
  else
    puts 'nothing to backup'
  end
end

def link_to_file_in_this_repo file
  backup_file file
  execute_cmd "ln -s #{Dir.pwd}/#{file} ~/.#{file}"
end

namespace :machine do
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

      link_to_file_in_this_repo 'bash_profile'
      link_to_file_in_this_repo 'gemrc'
      #link_to_file_in_this_repo 'bashrc'
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

    # Remove outdated versions from the cellar
    exectue_cmd "brew cleanup"

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
