web: bundle exec puma -C config/puma.rb
release: rake db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1 && rake db:setup