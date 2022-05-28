#!/bin/bash

source /tmp/src/build-env \
&& INSTALL_PKGS=$(cat /tmp/src/pkg-list.txt) \
&& subscription-manager register \
&& subscription-manager attach --pool=$BUILD_ACT_KEY \
&& subscription-manager refresh \
&& subscription-manager status \
&& dnf -y install $INSTALL_PKGS \
&& rpm -V --nosize --nofiledigest --nomtime --nomode $INSTALL_PKGS \
&& unset $(cat /tmp/src/build-env | cut -d'=' -f1) \
&& dnf clean all \
&& subscription-manager remove --all \
&& subscription-manager unregister \
&& subscription-manager clean
