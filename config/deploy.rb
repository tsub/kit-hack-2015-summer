# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'kithack2015-summer-api'
set :repo_url, 'git@github.com:tsub/kithack2015-summer-api.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/oz/kithack2015-summer-api'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

# rbenv config
set :rbenv_type, :user
set :rbenv_ruby, '2.2.2'
set :rbenv_prefix, "RBENV_ROOT=#{ fetch(:rbenv_path) } RBENV_VERSION=#{ fetch(:rbenv_ruby) } #{ fetch(:rbenv_path) }/bin/rbenv exec"
set :rbenv_map_bins, %w(rake gem bundle ruby rails)
set :rbenv_roles, :all

# set bundle option
set :bundle_jobs, 4
set :bundle_env_variables, { nokogiri_use_system_libraries: 1 }

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
