# Fetch environment variables with defaults
threads_count  = Integer(ENV.fetch('RAILS_MAX_THREADS', 5))      # default 5 threads
process_count  = Integer(ENV.fetch('RAILS_SERVER_PROCESSES', 2)) # default 2 workers
port           = Integer(ENV.fetch('PORT', 2358))                # default port 2358
rails_env      = ENV.fetch('RAILS_ENV', 'development')          # default development

# Puma configuration
threads threads_count, threads_count
workers process_count

port port
environment rails_env

plugin :tmp_restart
