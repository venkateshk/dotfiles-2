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
  expanded_path = File.expand_path(file)

  if File.symlink?(expanded_path)
    puts "#{file} is symlink to #{File.readlink(expanded_path)}"
    FileUtils.rm expanded_path
  elsif File.exists?(expanded_path)
    execute_cmd "git mv #{expanded_path} #{expanded_path}-#{Time.now.strftime('%Y-%m-%d-T%H%M%S%z')}"
  else
    puts 'nothign to backup'
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
      link_to_file_in_this_repo 'bashrc'
      link_to_file_in_this_repo 'gemrc'
  end

  task :brew do
    execute_cmd "brew update"
    execute_cmd "brew install git"
    execute_cmd "brew install git bash-completion"
    execute_cmd "brew install hub"
    execute_cmd "brew install tree"
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
