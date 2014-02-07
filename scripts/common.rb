require 'rubygems'
require 'launchy'
require 'open3'

def most_recent_production_tag
  execute_cmd "git fetch --tags"
  @_most_recent_production_tag ||= `git tag -l | grep production | sed 's/_/-/g' | sort -rg | head -n 1`.chomp
end

def repo_owner
  @_repo_owner ||= begin
    string = `git remote -v | grep fetch | grep origin`
    regex = /.*:(.*)\/.*/
    match_data = string.match(regex)
    match_data.to_a.last
  end
end

def repo_name
  @_repo_name ||= `git rev-parse --show-toplevel`.split('/').last.strip
end

def branch_name
  @_branch_name ||= (`git symbolic-ref HEAD`).gsub(%r[refs/heads/],'').strip
end

def open_url url
  puts url
  Launchy.open url
end


def execute_cmd cmd
  puts cmd
  lines = []
  Open3.popen2e(cmd) do |stdin, stdout_err, wait_thr|
    while line = stdout_err.gets
      puts line
      lines << line
    end

    exit_status = wait_thr.value
    unless exit_status.success?
      abort "FAILED !!! #{cmd}"
    end
  end

  lines
end


def ensure_hub_command_exists
  cmd = "hub --version"

  Open3.popen2e(cmd) do |stdin, stdout_err, wait_thr|
    exit_status = wait_thr.value
    unless exit_status.success?
      puts "hub command is not preset"
      abort "Please execute gem install hub"
    end
  end
end


