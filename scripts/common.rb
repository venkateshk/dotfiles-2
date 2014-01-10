require 'rubygems'
require 'launchy'

def repo_owner
  @_repo_owner ||= begin
    string = `git remote -v | grep fetch`
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

require 'open3'

def execute_cmd cmd
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


