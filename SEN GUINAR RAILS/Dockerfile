# Utiliser l'image officielle de Ruby comme base
FROM ruby:3.1.2

# Installer les dépendances nécessaires
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Définir le répertoire de travail
WORKDIR /app

# Copier le Gemfile et le Gemfile.lock dans le répertoire de travail
COPY Gemfile Gemfile.lock ./

# Installer les gems
RUN bundle install

# Copier le reste de l'application dans le conteneur
COPY . .

# Précompiler les assets (si nécessaire)
RUN bundle exec rake assets:precompile

# Exposer le port sur lequel l'application sera accessible
EXPOSE 3000

# Démarrer le serveur Puma
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
