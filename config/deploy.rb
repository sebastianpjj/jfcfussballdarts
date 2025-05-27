# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "jfcfussballdarts"
set :repo_url, "git@github.com:sebastianpjj/jfcfussballdarts.git"

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory
set :deploy_to, "/var/www/jfcfussballdarts"

# Ruby version managed by RVM
set :rvm_ruby_version, '3.1.4'

# Use PTY for some Rails/RVM setups
set :pty, true

# Linked files and directories (shared between releases)
append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage"

# Keep the last 5 releases
set :keep_releases, 5

# Uncomment to require manually verifying the host key before first deploy.
set :ssh_options, verify_host_key: :secure

namespace :deploy do
  namespace :check do
    before :linked_files, :set_master_key do
      on roles(:app) do
        unless test("[ -f #{shared_path}/config/master.key ]")
          if File.exist?("config/master.key")
            upload! "config/master.key", "#{shared_path}/config/master.key"
          else
            error "Missing config/master.key! Please make sure it exists."
            exit 1
          end
        end
      end
    end
  end
end