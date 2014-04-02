set :application, 'rails-blog'
set :repo_url, 'git@github.com:francistm/rails-blog.git'

set :scm, :git
set :rails_env, "production"
set :deploy_to, '/var/rails/francis_blog'

set :linked_dirs, %w(
  tmp/puma
)

set :linked_files, %w(
  config/database.yml
  config/initializers/qiniu-rs.rb
  config/initializers/secret_token.rb
)

set :rvm_type, :system
set :rvm_ruby_version, "2.0.0-p353"

namespace :deploy do
  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path} && ( bundle exec pumactl -P #{current_path}/tmp/puma/pid stop )"
    end
  end

  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path} && ( bundle exec puma -d -C #{current_path}/config/puma.rb )"
    end
  end

  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
    end
  end

  after "deploy:restart", "deploy:start"
  before "deploy:restart", "deploy:stop"
end
