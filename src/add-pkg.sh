#!/bin/bash

source /tmp/src/build-env \
&& INSTALL_PKGS=$(cat /tmp/src/pkg-list.txt) \
&& yum --disableplugin=subscription-manager -y install $INSTALL_PKGS \
&& yum --disableplugin=subscription-manager clean all \
&& unset $(cat /tmp/src/build-env | cut -d'=' -f1) \
&& dnf clean all
