workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection

  if defined?(Resque)
     Resque.redis = ENV["REDISTOGO_URL"] if ENV["REDISTOGO_URL"]
     Resque.redis ||= ENV["REDISCLOUD_URL"] if ENV["REDISCLOUD_URL"]
  end
end