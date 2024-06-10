# Nombre de threads minimum et maximum par worker
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

# Définir le port par défaut
port        ENV.fetch('PORT') { 3000 }

# Définir l'environnement d'exécution
environment ENV.fetch('RAILS_ENV') { 'development' }

# Définir le nombre de workers
workers Integer(ENV['WEB_CONCURRENCY'] || 2)

# Précharger l'application avant de forker les workers pour utiliser la copie en écriture
preload_app!

on_worker_boot do
  # Code à exécuter lorsque le worker démarre
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# Autoriser Puma à se redémarrer avec `rails restart` command
plugin :tmp_restart
