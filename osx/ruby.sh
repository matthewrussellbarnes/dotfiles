#!/usr/bin/env bash

default_ruby_version=2.6.3
default_ruby_version_installed=$(chruby | grep $default_ruby_version | wc -l)

if [ $default_ruby_version_installed  -gt 0 ]; then
    echo "default ruby version installed"
else
    ruby-install ruby 2.6.3
fi
