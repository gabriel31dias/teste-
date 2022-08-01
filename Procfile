release: bundle exec rails db:migrate && bundle exec rails db:seed && rails generate audited:install && rake db:migrate
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
