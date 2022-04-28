# config/initializers/health_check.rb

# Your health check will be available on 
# https://my-app.com/health_check
HealthCheck.setup do |config|
    # Text output upon success
    config.success = 'Alive!'

    # Standard checks
    config.standard_checks = %w[database migrations cache]
end
