sudo apt-get update
sudo apt-get -y install build-essential
sudo apt-get install silversearcher-ag
sudo apt-get install unzip

# For erlang
sudo apt-get -y install autoconf
sudo apt-get -y install libncurses5-dev
# for wxWidgets (start observer or debugger)
sudo apt-get -y install libwxgtk3.0-dev libgl1-mesa-dev libglu1-mesa-dev libpng3
sudo apt-get -y install libssh-dev
sudo apt-get -y install unixodbc-dev
# End erlang

# For ubuntu, postgres needs:
sudo apt-get install libreadline-dev
# End postgres

# For rails
sudo apt-get install libxml2
# End section for rails

# For ansible
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
#
