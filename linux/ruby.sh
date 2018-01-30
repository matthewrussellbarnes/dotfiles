## TMP DIRS
TMP_DIR=~/install_tmp
mkdir -p "$TMP_DIR" && cd "$TMP_DIR"

chruby_version=$(chruby --version | awk -F"[ ',]+" '/chruby:/{print $2}')
if [ $chruby_version = "0.3.9" ]; then
    echo "chruby version up to date"
else
    echo "installing chruby"
    wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
    tar -xzvf chruby-0.3.9.tar.gz
    cd chruby-0.3.9/
    sudo make install
    echo "install of chruby complete"
fi


# cd "$TMP_DIR"

ruby_install_version=$(ruby-install -V | awk -F"[ ',]+" '/install:/{print $2}')
if [ $ruby_install_version = "0.6.1" ]; then
    echo "ruby-install version up to date"
else
    echo "installing ruby-install"
    wget -O ruby-install-0.6.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.1.tar.gz
    tar -xzvf ruby-install-0.6.1.tar.gz
    cd ruby-install-0.6.1/
    sudo make install
    echo "install of ruby-install complete"
fi

cd ~/ && rm -rf "$TMP_DIR"
