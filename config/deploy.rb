set :application, 'rails-blog'
set :repo_url, 'git@github.com:francistm/rails-blog.git'

set :scm, :git
set :rails_env, "production"
set :deploy_to, '/var/rails/francis_blog'

set :rvm_type, :system
set :rvm_ruby_version, "2.0.0-p353"

namespace :symlink do
  task :config do
    on roles(:app), :in => :sequence, :wait => 5 do
      execute "if [ ! -e '#{release_path}/config/database.yml' ]; then ln -s #{shared_path}/database.yml #{release_path}/config; fi"
      execute "if [ ! -e '#{release_path}/config/initializers/qiniu-rs.rb' ]; then ln -s #{shared_path}/qiniu-rs.rb #{release_path}/config/initializers; fi"
      execute "if [ -e '#{release_path}/config/initializers/secret_token.rb' ]; then rm #{release_path}/config/initializers/secret_token.rb; ln -s #{shared_path}/secret_token.rb #{release_path}/config/initializers; fi"
    end
  end
end

namespace :deploy do
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      # link puma state files from shared path
      execute "if [ ! -e '#{shared_path}/puma' ]; then mkdir -p #{shared_path}/puma; fi"
      execute "if [ ! -e '#{current_path}/tmp/puma' ]; then ln -s #{shared_path}/puma #{current_path}/tmp; fi"
      execute "cd #{current_path} && ( bundle exec pumactl -P #{current_path}/tmp/puma/pid stop )"
    end
  end

  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      # link puma state files from shared path
      execute "if [ ! -e '#{shared_path}/puma' ]; then mkdir -p #{shared_path}/puma; fi"
      execute "if [ ! -e '#{current_path}/tmp/puma' ]; then ln -s #{shared_path}/puma #{current_path}/tmp; fi"
      execute "cd #{current_path} && ( bundle exec puma -d -C #{current_path}/config/puma.rb )"
    end
  end

  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
    end
  end

  after "deploy:restart", "deploy:start"
  before "deploy:restart", "deploy:stop"

  before "deploy:updated", "symlink:config"
end
