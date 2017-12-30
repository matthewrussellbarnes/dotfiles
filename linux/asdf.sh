ASDF_DIR=~/.asdf
ASDF_VERSION="v0.4.0"

if [ -d ~/.asdf/plugins/postgres ]; then
    cd $ASDF_DIR && git pull origin $ASDF_VERSION
    cd ~/
else
    git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch $ASDF_VERSION
fi

asdf plugin-update --all

if [ ! -d ~/.asdf/plugins/postgres ]; then
    asdf plugin-add postgres http://github.com/smashedtoatoms/asdf-postgres.git
fi

if [ ! -d ~/.asdf/plugins/redis ]; then
    asdf plugin-add redis http://github.com/smashedtoatoms/asdf-redis.git
fi

if [ ! -d ~/.asdf/plugins/nodejs ]; then
    asdf plugin-add nodejs http://github.com/asdf-vm/asdf-nodejs.git
    . ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
fi

if [ ! -d ~/.asdf/plugins/erlang ]; then
    asdf plugin-add erlang http://github.com/asdf-vm/asdf-erlang.git
fi

if [ ! -d ~/.asdf/plugins/elixir ]; then
    asdf plugin-add elixir http://github.com/asdf-vm/asdf-elixir.git
fi

if [ ! -d ~/.asdf/plugins/terraform ]; then
    asdf plugin-add terraform http://github.com/Banno/asdf-hashicorp.git
fi

if [ ! -d ~/.asdf/plugins/packer ]; then
    asdf plugin-add packer http://github.com/Banno/asdf-hashicorp.git
fi

if [ ! -d ~/.asdf/plugins/java ]; then
    asdf plugin-add java http://github.com/skotchpine/asdf-java.git
fi

if [ ! -d ~/.asdf/plugins/spark ]; then
    asdf plugin-add spark http://github.com/joshuaballoch/asdf-spark.git
fi

asdf install postgres 9.5.6
asdf global postgres 9.5.6

asdf install redis 4.0.6
asdf global redis 4.0.6

asdf install nodejs 6.11.4
asdf global nodejs 6.11.4

asdf install erlang 20.0
asdf global erlang 20.0

asdf install elixir 1.5.2
asdf global elixir 1.5.2

asdf install terraform 0.11.1
asdf global terraform 0.11.1

asdf install packer 1.1.3
asdf global packer 1.1.3

asdf install java 9.0.1
asdf global java 9.0.1

asdf install spark 2.2.1
asdf global spark 2.2.1
