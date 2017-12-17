## TMP DIRS
TMP_DIR=~/install_tmp
mkdir -p "$TMP_DIR" && cd "$TMP_DIR"

echo "installing chruby"
# Install chruby:
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install

echo "install of chruby complete"

cd "$TMP_DIR"

echo "installing ruby-install"
# Install ruby-install:
wget -O ruby-install-0.6.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.1.tar.gz
tar -xzvf ruby-install-0.6.1.tar.gz
cd ruby-install-0.6.1/
sudo make install

echo "install of ruby-install complete"

cd ~/ && rm -rf "$TMP_DIR"
