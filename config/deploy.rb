# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'rails4-sample'
set :repo_url, 'git@github.com:umeyuki/rails4-sample.git'

set :deploy_to, '/export/rails4-sample'
set :scm, :git

set :keep_releases, 5

set :linked_dirs, (fetch(:linked_dirs) + ['tmp/pids'])

set :default_env, { path: '/home/umeyuki/local/ruby-2.1.1/bin:$PATH' }

set :unicorn_rack_env, "none"
set :unicorn_config_path, 'config/unicorn.rb'

after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
