threads 1, 4
environment "production"
basedir = "/var/rails/francis_blog/current"

activate_control_app
bind 'tcp://127.0.0.1:1643'
pidfile "#{basedir}/tmp/puma/pid"
state_path "#{basedir}/tmp/puma/state"
