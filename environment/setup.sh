RUBY_VERSION="2.5.1"
RAILS_VERSION="5.0.2"

echo
echo "========================================================================"
echo "# ATUALIZANDO O SISTEMA OPERACIONAL"
echo "========================================================================"
sudo apt-get update && sudo apt-get upgrade -y

echo
echo "========================================================================"
echo "# INSTALANDO DEPENDENCIAS DO RVM/RUBY"
echo "========================================================================"

sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev \ 
                    libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common \ 
                    libffi-dev nodejs yarn

echo
echo "======================================================================="
echo "# INSTALANDO E CONFIGURANDO O RBENV"
echo "========================================================================"
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

echo
echo "========================================================================"
echo "# INSTALANDO E CONFIGURANDO O RUBY NA VERSAO: ${RUBY_VERSION}"
echo "========================================================================"
rbenv install ${RUBY_VERSION}
rbenv local ${RUBY_VERSION}
ruby -v
touch ~/.gemrc
echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc

echo
echo "========================================================================"
echo "# INSTALANDO E CONFIGURANDO O RAILS NA VERSAO: ${RAILS_VERSION}"
echo "========================================================================"
gem install rails -v ${RAILS_VERSION}
gem install bundler

echo
echo "========================================================================"
echo "# INSTALANDO LIB MYSQL"
echo "========================================================================"
sudo apt-get install libmysqlclient-dev -y