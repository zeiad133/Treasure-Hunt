#! /bin/bash
APP_NAME=$1
# Checks if application name is passed
if [[ -z "$APP_NAME" ]]; then
  echo '=> You must pass the application name as an argument'
  exit 1
fi

# checks if ruby is installed
dpkg -s ruby &> /dev/null
if [[ $? -ne 0 ]]; then
  echo "=> You must have ruby installed"
  exit 1
fi

# Installing thor and sshkit
echo "=> Installing dependencies"
gem install thor sshkit

echo "=> Updating git submodules"
git submodule update --init --recursive


# Setting up the app
echo "=> Setting up the app"
PASCAL_APP_NAME=$(echo $APP_NAME | sed -r 's/(^|_|-)([a-z])/\U\2/g')
sed -i -e "s/PASCAL_APP_NAME/$PASCAL_APP_NAME/g" config/application.rb
sed -i -e "s/APP_NAME/$APP_NAME/g" config/application.rb
sed -i -e "s/APP_NAME/$APP_NAME/g" config/database.yml.copy
cp config/database.yml.copy config/database.yml
cp config/secrets.yml.copy config/secrets.yml
printf "=> Copying the development env file\n\t === don't forget to update it with the right values ===\n"
sed -i -e "s/PASCAL_APP_NAME/$PASCAL_APP_NAME/g" docker/.env.copy
cp docker/.env.copy docker/development/.env
