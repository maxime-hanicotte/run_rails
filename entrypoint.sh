# !/bin/bash
set -e

# Environment setup
# Rails master key Secrets are accessed through Berglas
# export RAILS_MASTER_KEY=$RAILS_KEY

# Run deploy tasks in warmup mode
if [ "$WARMUP_DEPLOY" == "true" ]; then
  # The traditional Rails migration
  echo "Warmup deploy: running migrations..."
  bundle exec rails db:migrate
  echo "Warmup deploy: migrations done"
  export WARMUP_DEPLOY=false

  # This is a custom Rake task which perform additional steps our application needs 
  # (e.g. setup cron jobs via Cloudtasker)
  # echo "Warmup deploy: running deploy tasks..."
  # bundle exec rake deploy:prepare
  # echo "Warmup deploy: deploy tasks done"
fi

# Start server
bin/rails server -b 0.0.0.0 -p 8080
