# Utiliser une image Ruby officielle, spécifiez une version compatible avec Rails 5.0.2
FROM ruby:2.3.8

# Installer les dépendances du système
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Définir le répertoire de travail dans le conteneur
WORKDIR /myapp

# Copier le Gemfile et le Gemfile.lock dans le répertoire de travail
COPY Gemfile Gemfile.lock ./

# Installer les gemmes via Bundler
RUN gem install bundler -v 2.4.17 && bundle install --jobs 20 --retry 5

# Copier le reste de l'application dans le conteneur
COPY . .

# Rendre les binaires exécutables (si nécessaire)
RUN chmod +x bin/*

# Précompiler les assets pour l'environnement de production
RUN bundle exec rake assets:precompile

# Exposer le port que le serveur Rails utilisera
EXPOSE 3000

# La commande pour démarrer le serveur Rails
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
