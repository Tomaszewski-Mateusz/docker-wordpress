#!/bin/sh

# Configure Git
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"

# Clone or pull the repository
THEME_DIR="/var/www/html/wp-content/themes/local_theme"
if [ -d "$THEME_DIR/.git" ]; then
  echo "Repository exists. Pulling latest changes..."
  git -C "$THEME_DIR" pull
else
  echo "Cloning repository..."
  git clone https://${GIT_USERNAME}:${GIT_PERSONAL_TOKEN}@${GIT_REPO} "$THEME_DIR"
fi

# Start the default WordPress entrypoint script
exec docker-entrypoint.sh apache2-foreground
